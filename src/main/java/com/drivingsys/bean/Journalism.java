package com.drivingsys.bean;


public class Journalism {

  private int jid;
  private String jtitle;
  private String jabstract;
  private String jtext;
  private String jauthor;
  private String jtime;
  private String jphoto;
  private String jyear;
  private String jmonth;
  private String jday;
  private int jliulan;

  public Journalism()
  {
  }

  public Journalism(int jid, String jtitle, String jabstract, String jtext, String jauthor, String jtime, String jphoto, String jyear, String jmonth, String jday, int jliulan)
  {
    this.jid = jid;
    this.jtitle = jtitle;
    this.jabstract = jabstract;
    this.jtext = jtext;
    this.jauthor = jauthor;
    this.jtime = jtime;
    this.jphoto = jphoto;
    this.jyear = jyear;
    this.jmonth = jmonth;
    this.jday = jday;
    this.jliulan = jliulan;
  }

  public int getJid()
  {
    return jid;
  }

  public void setJid(int jid)
  {
    this.jid = jid;
  }

  public String getJtitle()
  {
    return jtitle;
  }

  public void setJtitle(String jtitle)
  {
    this.jtitle = jtitle;
  }

  public String getJabstract()
  {
    return jabstract;
  }

  public void setJabstract(String jabstract)
  {
    this.jabstract = jabstract;
  }

  public String getJtext()
  {
    return jtext;
  }

  public void setJtext(String jtext)
  {
    this.jtext = jtext;
  }

  public String getJauthor()
  {
    return jauthor;
  }

  public void setJauthor(String jauthor)
  {
    this.jauthor = jauthor;
  }

  public String getJtime()
  {
    return jtime;
  }

  public void setJtime(String jtime)
  {
    this.jtime = jtime;
  }

  public String getJphoto()
  {
    return jphoto;
  }

  public void setJphoto(String jphoto)
  {
    this.jphoto = jphoto;
  }

  public String getJyear()
  {
    return jyear;
  }

  public void setJyear(String jyear)
  {
    this.jyear = jyear;
  }

  public String getJmonth()
  {
    return jmonth;
  }

  public void setJmonth(String jmonth)
  {
    this.jmonth = jmonth;
  }

  public String getJday()
  {
    return jday;
  }

  public void setJday(String jday)
  {
    this.jday = jday;
  }

  public int getJliulan()
  {
    return jliulan;
  }

  public void setJliulan(int jliulan)
  {
    this.jliulan = jliulan;
  }
}
