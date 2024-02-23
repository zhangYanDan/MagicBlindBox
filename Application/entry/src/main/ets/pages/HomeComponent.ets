@Component
export struct HomeContent {
  private productList: string[] = ['数码宝贝', '壕穿地表', '苹果壕包', '电竞神器','神奇积木']
  private swiperController=new SwiperController();
  /**
   * 轮播条
   */
  @Builder TopSwiperSlider(){
    Row(){
      Swiper(this.swiperController) {
        ForEach(this.productList, (item) => {
          Text(item).fontColor(0xFFFFFF).fontSize(15)
            .padding({left:10,right:10})
            .textAlign(TextAlign.Center)
        }, (item) => item)
      }
      .loop(true)
      .indicator(false)
      .displayCount(3)
      .backgroundImage($r('app.media.product_cont'))
      .backgroundImageSize({width:'100%',height:50})
      .height(50)
      .width('90%')
      .margin({bottom:20})
    }.height('100%').alignItems(VerticalAlign.Bottom)
  }
  /**
   * 轮播按钮以及盲盒盒子
   */
  @Builder TopBoxSwiperBtn(){
    Row(){
      Row(){
        // 左箭头
        Image($r('app.media.left_img'))
          .width(35)
        .onClick(()=>{
          this.swiperController.showPrevious()
        })
        // 盒子以及查看宝贝按钮
        Stack({alignContent:Alignment.Center}){
          Image($r('app.media.box'))
            .width(150)
          Image($r('app.media.see_product'))
            .width(54)
            .margin({left:120,top:80})
        }
        // 右箭头
        Image($r('app.media.right_img'))
          .width(35)
          .onClick(()=>{
            this.swiperController.showNext()
          })
      }.justifyContent(FlexAlign.SpaceBetween).alignItems(VerticalAlign.Center).width('100%')
    }.width('86%').height('84%').alignItems(VerticalAlign.Bottom)
  }
  /**
   * 头部功能区
   */
  @Builder TopHeadFunc(){
    Row(){
      Row(){
        // 盒柜
        Image($r('app.media.head_img1')).width(80)
          .margin({right:10})
        // 卡券
        Image($r('app.media.head_img2')).width(80)
      }
      Row(){
        // 音乐
        Image($r('app.media.head_img3')).width(30).margin({right:10})
        // 语言
        Image($r('app.media.head_img4')).width(30)
      }

    }.justifyContent(FlexAlign.SpaceBetween).width('86%').margin({top:20})
  }
    private list:number[]=[1,2,3,4,5,6,7,8,9,10,11,12];
  @Builder TopLightProduct(){
  Grid(){
    ForEach(this.list,(item:number)=>{
      GridItem(){
        Row(
        ).border({width:1,color:0xFF0000,radius:60}).width(60).height(60)
      }
    })
  }
  .columnsTemplate('1fr 1fr 1fr')
  .columnsGap(10)
  .rowsGap(10)
  .width('80%')
  .height('80%')
  .margin({top:50})
  .backgroundImage($r('app.media.light'))
    .backgroundImageSize({width:'90%',height:'80%'})
}
  @Builder TopTips(){
    Row(){
      Image($r('app.media.tips2'))
        .width(40)
      Image($r('app.media.tips1'))
        .width(40)
    }
    .width('100%')
    .height('84%')
    .alignItems(VerticalAlign.Bottom)
    .justifyContent(FlexAlign.SpaceBetween)
  }
  /**
   * 首页上部分
   */
  @Builder Top() {
    Stack({alignContent:Alignment.Top}) {
      this.TopHeadFunc()
      this.TopLightProduct()
      this.TopTips()
      this.TopBoxSwiperBtn()
      this.TopSwiperSlider()
    }
    .width('100%')
    .flexGrow(1)
  }


  /**
   * 首页下部分
   * 立即开箱
   */
  @Builder Bottom() {
    Stack({ alignContent: Alignment.Top }) {
      Image($r('app.media.open_box_cont'))
        .width('100%')
        .height(166)
      Row({ space: 40 }) {
        // 免费开箱广告
        Image($r('app.media.open_box_img1'))
          .width(55)
        // 立即开箱
        Image($r('app.media.open_box_btn'))
          .width(135)
        // 在线客服
        Image($r('app.media.open_box_img2'))
          .width(48)
      }
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)

      Row() {
        Text() {
          Span('￥').fontSize(14).fontColor(0xFFFFFF).fontWeight(FontWeight.Bold)
          Span('69.0').fontSize(20).fontColor(0xFFFFFF).fontWeight(FontWeight.Bold)
        }.padding({ bottom: 6 })
      }.height(166).alignItems(VerticalAlign.Bottom)
      .zIndex(2)
    }.height(208)
  }

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column }) {
        this.Top()
        this.Bottom()
      }
    }
    .width('100%')
    .height('100%')
  }
}