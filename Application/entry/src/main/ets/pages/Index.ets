import { HomeButton } from '../components/HomeButton';
import { Constants } from '../common/Constants';
import { AGCAuth, AgUser } from '../services/Auth';
import { AGConnectUser } from '@hw-agconnect/auth-ohos';
import { HomeContent } from './HomeComponent'

@Entry
@Component
struct Index {
  @StorageLink('user') currentUser: AgUser = new AgUser();
  @State agcUser: AGConnectUser = null;

  async aboutToAppear() {
    // 杀掉进程重启情况
    this.agcUser = await new AGCAuth(getContext(this)).getCurrentUser();
    if (this.agcUser) {
      let agcUserExtra = await this.agcUser.getUserExtra();
      this.currentUser = new AgUser(
        this.agcUser.getUid(),
        this.agcUser.getPhotoUrl(),
        this.agcUser.getPhone(),
        this.agcUser.getDisplayName(),
        agcUserExtra.getCreateTime(),
        agcUserExtra.getLastSignInTime());
      AppStorage.Set<AgUser>('user', this.currentUser);
    }
  }

  @State currentIndex: number = 0;
  private tabsController = new TabsController();

  @Builder TabBuilder(title: Resource, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? $r('app.color.theme_primary') : $r('app.color.theme_text_9'))
        .margin({ top: 5 })
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    });
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        Column() {
          HomeContent()
        }.width('100%')
        .height('100%')
        .backgroundColor(0xFFFFFF)
      }
      .tabBar(this.TabBuilder($r('app.string.tab_title_home'), 0, $r('app.media.icon_my_selected'), $r('app.media.icon_my')))

      TabContent() {
        Column() {
          Text('内容2')
        }.width('100%')
        .height('100%')
        .backgroundColor(0xFFFFFF)
      }
      .tabBar(this.TabBuilder($r('app.string.tab_title_shop'), 1, $r('app.media.icon_shop_selected'), $r('app.media.icon_shop')))

      TabContent() {
        Column() {
          Text('内容3')
        }.width('100%')
        .height('100%')
        .backgroundColor(0xFFFFFF)
      }
      .tabBar(this.TabBuilder($r('app.string.tab_title_star'), 2, $r('app.media.icon_star_selected'), $r('app.media.icon_star')))

      TabContent() {
        Column() {
          Text('内容4')
        }.width('100%')
        .height('100%')
        .backgroundColor(0xFFFFFF)
      }
      .tabBar(this.TabBuilder($r('app.string.tab_title_task'), 3, $r('app.media.icon_task_selected'), $r('app.media.icon_task')))

      TabContent() {
        Column() {
          Text('内容5')
        }.width('100%')
        .height('100%')
        .backgroundColor(0xFFFFFF)
      }
      .tabBar(this.TabBuilder($r('app.string.tab_title_my'), 4, $r('app.media.icon_my_selected'), $r('app.media.icon_my')))
    }
  }
}

