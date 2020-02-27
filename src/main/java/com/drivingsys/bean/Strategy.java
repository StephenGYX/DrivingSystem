package com.drivingsys.bean;

public class Strategy {

  private int sid;
  private String stitle;
  private String sabstract;
  private String stext;
  private String sauthor;
  private String stime;
  private String sphoto;
  private String syear;
  private String smonth;
  private String sday;
  private int sliulan;

  public Strategy()
  {
  }

  public Strategy(int sid, String stitle, String sabstract, String stext, String sauthor, String stime, String sphoto, String syear, String smonth, String sday, int sliulan)
  {
    this.sid = sid;
    this.stitle = stitle;
    this.sabstract = sabstract;
    this.stext = stext;
    this.sauthor = sauthor;
    this.stime = stime;
    this.sphoto = sphoto;
    this.syear = syear;
    this.smonth = smonth;
    this.sday = sday;
    this.sliulan = sliulan;
  }

  public int getSid()
  {
    return sid;
  }

  public void setSid(int sid)
  {
    this.sid = sid;
  }

  public String getStitle()
  {
    return stitle;
  }

  public void setStitle(String stitle)
  {
    this.stitle = stitle;
  }

  public String getSabstract()
  {
    return sabstract;
  }

  public void setSabstract(String sabstract)
  {
    this.sabstract = sabstract;
  }

  public String getStext()
  {
    return stext;
  }

  public void setStext(String stext)
  {
    this.stext = stext;
  }

  public String getSauthor()
  {
    return sauthor;
  }

  public void setSauthor(String sauthor)
  {
    this.sauthor = sauthor;
  }

  public String getStime()
  {
    return stime;
  }

  public void setStime(String stime)
  {
    this.stime = stime;
  }

  public String getSphoto()
  {
    return sphoto;
  }

  public void setSphoto(String sphoto)
  {
    this.sphoto = sphoto;
  }

  public String getSyear()
  {
    return syear;
  }

  public void setSyear(String syear)
  {
    this.syear = syear;
  }

  public String getSmonth()
  {
    return smonth;
  }

  public void setSmonth(String smonth)
  {
    this.smonth = smonth;
  }

  public String getSday()
  {
    return sday;
  }

  public void setSday(String sday)
  {
    this.sday = sday;
  }

  public int getSliulan()
  {
    return sliulan;
  }

  public void setSliulan(int sliulan)
  {
    this.sliulan = sliulan;
  }
}
