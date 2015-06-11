function fn_setTab6(){
	tab6 = subTabbar.tabs("a6").attachLayout("3E");
    tab6.cells("a").setText("1. 특허출원");
    tab6.cells("b").setText("2. 논문발표");
    tab6.cells("c").setText("3. 주요개발기술 및 활용계획");
    tab6.cells("a").setHeight(65);
    tab6.cells("b").setHeight(65);
    tab6.cells("a").attachObject("tab6_1");
    tab6.cells("b").attachObject("tab6_2");
    tab6.cells("c").attachObject("tab6_3");
}
