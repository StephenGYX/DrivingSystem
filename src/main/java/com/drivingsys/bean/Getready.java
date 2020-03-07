package com.drivingsys.bean;

public class Getready {

  private int gid;
  private String gname;
  private String gphone;
  private String gdesire;
  private String gtime;
  private String gchatrecord;
  private int gstate;

  public Getready()
  {
  }

  public Getready(int gid, String gname, String gphone, String gdesire, String gtime, String gchatrecord, int gstate)
  {
    this.gid = gid;
    this.gname = gname;
    this.gphone = gphone;
    this.gdesire = gdesire;
    this.gtime = gtime;
    this.gchatrecord = gchatrecord;
    this.gstate = gstate;
  }

  public int getGid()
  {
    return gid;
  }

  public void setGid(int gid)
  {
    this.gid = gid;
  }

  public String getGname()
  {
    return gname;
  }

  public void setGname(String gname)
  {
    this.gname = gname;
  }

  public String getGphone()
  {
    return gphone;
  }

  public void setGphone(String gphone)
  {
    this.gphone = gphone;
  }

  public String getGdesire()
  {
    return gdesire;
  }

  public void setGdesire(String gdesire)
  {
    this.gdesire = gdesire;
  }

  public String getGtime()
  {
    return gtime;
  }

  public void setGtime(String gtime)
  {
    this.gtime = gtime;
  }

  public String getGchatrecord()
  {
    return gchatrecord;
  }

  public void setGchatrecord(String gchatrecord)
  {
    this.gchatrecord = gchatrecord;
  }

  public int getGstate()
  {
    return gstate;
  }

  public void setGstate(int gstate)
  {
    this.gstate = gstate;
  }
}
