function fn_setTab5(){
	tab5 = subTabbar.tabs("a5").attachLayout("2E");
	tab5.cells("a").setHeight(65);
    tab5.cells("a").setText("1.수준");
    tab5.cells("b").setText("2. 개발목표 주요 Spec 및 차별화 Point");
    tab5.cells("a").attachObject("tab5_1");
    tab5.cells("b").attachObject("tab5_2");
}
