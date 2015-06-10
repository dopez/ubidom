function fn_setTab6(){
	tab6 = subTabbar.tabs("a5").attachLayout("2E");
	tab6.cells("a").setHeight(65);
    tab6.cells("a").setText("1.수준");
    tab6.cells("b").setText("2. 개발목표 주요 Spec 및 차별화 Point");
    tab6.cells("a").attachObject("tab6_1");
    tab6.cells("b").attachObject("tab6_2");
}
