package com.toinfra.VO;

public class Task_reply {
    private int reply_no;
    private String emp_name;
    private String create_date;
    private String row_dept_name;
    private String task_no;
    private String contents;
    private String pic;

    public int getReply_no() {
        return reply_no;
    }

    public void setReply_no(int reply_no) {
        this.reply_no = reply_no;
    }

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getRow_dept_name() {
        return row_dept_name;
    }

    public void setRow_dept_name(String row_dept_name) {
        this.row_dept_name = row_dept_name;
    }

    public String getTask_no() {
        return task_no;
    }

    public void setTask_no(String task_no) {
        this.task_no = task_no;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    @Override
    public String toString() {
        return "Task_reply{" +
                "reply_no=" + reply_no +
                ", emp_name='" + emp_name + '\'' +
                ", create_date='" + create_date + '\'' +
                ", row_dept_name='" + row_dept_name + '\'' +
                ", task_no='" + task_no + '\'' +
                ", contents='" + contents + '\'' +
                ", pic='" + pic + '\'' +
                '}';
    }
}
