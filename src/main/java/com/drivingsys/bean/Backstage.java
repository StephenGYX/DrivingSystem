package com.drivingsys.bean;

public class Backstage {

  private int bid;
  private String baccount;
  private String bpassword;
  private String bname;
  private int rid;
  private String bstate;

  public Backstage()
  {
  }

  public Backstage(int bid, String baccount, String bpassword, String bname, int rid, String bstate)
  {
    this.bid = bid;
    this.baccount = baccount;
    this.bpassword = bpassword;
    this.bname = bname;
    this.rid = rid;
    this.bstate = bstate;
  }

  public int getBid()
  {
    return bid;
  }

  public void setBid(int bid)
  {
    this.bid = bid;
  }

  public String getBaccount()
  {
    return baccount;
  }

  public void setBaccount(String baccount)
  {
    this.baccount = baccount;
  }

  public String getBpassword()
  {
    return bpassword;
  }

  public void setBpassword(String bpassword)
  {
    this.bpassword = bpassword;
  }

  public String getBname()
  {
    return bname;
  }

  public void setBname(String bname)
  {
    this.bname = bname;
  }

  public int getRid()
  {
    return rid;
  }

  public void setRid(int rid)
  {
    this.rid = rid;
  }

  public String getBstate()
  {
    return bstate;
  }

  public void setBstate(String bstate)
  {
    this.bstate = bstate;
  }
}
