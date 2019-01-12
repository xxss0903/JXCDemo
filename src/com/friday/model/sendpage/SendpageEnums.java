package com.friday.model.sendpage;

public final class SendpageEnums {
    // 标签类型
    public enum CategoryEnum {
        BIAOQIAN(1, "标签材料");

        private Integer num;
        private String name;

        CategoryEnum(Integer num, String name){
            this.num = num;
            this.name = name;
        }

        public Integer getNum() {
            return num;
        }

        public String getName() {
            return name;
        }
    }

    // 开票类型
    public enum KpType {
        COMPANY(1, "公司账号");

        private Integer num;
        private String name;

        KpType(Integer num, String name) {
            this.num = num;
            this.name = name;
        }

        public Integer getNum() {
            return num;
        }

        public void setNum(Integer num) {
            this.num = num;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }


}
