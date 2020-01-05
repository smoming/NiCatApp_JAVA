package pers.ming.nicat.enums;

public enum SaveAction {
    Added("新增"),
    Modified("修改"),
    Deleted("刪除");

    private String description;
 
    // 不公開的建構方法
    private SaveAction(String description) {
        this.description = description;
    }
 
    public String getDescription() {
        return description;
    }
}