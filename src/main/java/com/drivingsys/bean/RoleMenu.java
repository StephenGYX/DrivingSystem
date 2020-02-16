package com.drivingsys.bean;

public class RoleMenu
{

  private long rid;
  private String fallocation;
  private String first;
  private String second;
  private String mlink;

  public RoleMenu()
  {
  }

  public RoleMenu(long rid, String fallocation, String first, String second, String mlink)
  {
    this.rid = rid;
    this.fallocation = fallocation;
    this.first = first;
    this.second = second;
    this.mlink = mlink;
  }

  public long getRid()
  {
    return rid;
  }

  public void setRid(long rid)
  {
    this.rid = rid;
  }

  public String getFallocation()
  {
    return fallocation;
  }

  public void setFallocation(String fallocation)
  {
    this.fallocation = fallocation;
  }

  public String getFirst()
  {
    return first;
  }

  public void setFirst(String first)
  {
    this.first = first;
  }

  public String getSecond()
  {
    return second;
  }

  public void setSecond(String second)
  {
    this.second = second;
  }

  public String getMlink()
  {
    return mlink;
  }

  public void setMlink(String mlink)
  {
    this.mlink = mlink;
  }

  @Override
  public String toString()
  {
    return "RoleMenu{" + "rid=" + rid + ", fallocation='" + fallocation + '\'' + ", first='" + first + '\'' + ", second='" + second + '\'' + ", mlink='" + mlink + '\'' + '}';
  }
}
