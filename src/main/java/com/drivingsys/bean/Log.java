package com.drivingsys.bean;

public class Log {

  private int lid;
  private int loperatorid;
  private int lrole;
  private String ltype;
  private String lbehavior;
  private String lip;
  private String ltime;
  private String lmethod;

  public Log()
  {
  }

  public Log(int lid, int loperatorid, int lrole, String ltype, String lbehavior, String lip, String ltime, String lmethod)
  {
    this.lid = lid;
    this.loperatorid = loperatorid;
    this.lrole = lrole;
    this.ltype = ltype;
    this.lbehavior = lbehavior;
    this.lip = lip;
    this.ltime = ltime;
    this.lmethod = lmethod;
  }

  @Override
  public String toString()
  {
    return "Log{" + "lid=" + lid + ", loperatorid=" + loperatorid + ", lrole=" + lrole + ", ltype='" + ltype + '\'' + ", lbehavior='" + lbehavior + '\'' + ", lip='" + lip + '\'' + ", ltime='" + ltime + '\'' + ", lmethod='" + lmethod + '\'' + '}';
  }

  public int getLid()
  {
    return lid;
  }

  public void setLid(int lid)
  {
    this.lid = lid;
  }

  public int getLoperatorid()
  {
    return loperatorid;
  }

  public void setLoperatorid(int loperatorid)
  {
    this.loperatorid = loperatorid;
  }

  public int getLrole()
  {
    return lrole;
  }

  public void setLrole(int lrole)
  {
    this.lrole = lrole;
  }

  public String getLtype()
  {
    return ltype;
  }

  public void setLtype(String ltype)
  {
    this.ltype = ltype;
  }

  public String getLbehavior()
  {
    return lbehavior;
  }

  public void setLbehavior(String lbehavior)
  {
    this.lbehavior = lbehavior;
  }

  public String getLip()
  {
    return lip;
  }

  public void setLip(String lip)
  {
    this.lip = lip;
  }

  public String getLtime()
  {
    return ltime;
  }

  public void setLtime(String ltime)
  {
    this.ltime = ltime;
  }

  public String getLmethod()
  {
    return lmethod;
  }

  public void setLmethod(String lmethod)
  {
    this.lmethod = lmethod;
  }
}
