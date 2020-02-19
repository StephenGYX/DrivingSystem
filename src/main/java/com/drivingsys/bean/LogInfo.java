package com.drivingsys.bean;

public class LogInfo {

  private long log_Id;
  private long user_Id;
  private String log_Time;
  private String log_Type;

  public LogInfo() {
  }

  public LogInfo(long log_Id, long user_Id, String log_Time, String log_Type)
  {
    this.log_Id = log_Id;
    this.user_Id = user_Id;
    this.log_Time = log_Time;
    this.log_Type = log_Type;
  }

  public long getLog_Id()
  {
    return log_Id;
  }

  public void setLog_Id(long log_Id)
  {
    this.log_Id = log_Id;
  }

  public long getUser_Id()
  {
    return user_Id;
  }

  public void setUser_Id(long user_Id)
  {
    this.user_Id = user_Id;
  }

  public String getLog_Time()
  {
    return log_Time;
  }

  public void setLog_Time(String log_Time)
  {
    this.log_Time = log_Time;
  }

  public String getLog_Type()
  {
    return log_Type;
  }

  public void setLog_Type(String log_Type)
  {
    this.log_Type = log_Type;
  }
}
