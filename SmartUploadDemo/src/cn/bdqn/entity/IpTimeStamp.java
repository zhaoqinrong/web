package cn.bdqn.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class IpTimeStamp {
	
		private String ip=null;
		private SimpleDateFormat sdf=null;
		public IpTimeStamp(){
			
		}
		public IpTimeStamp(String ip){
			this.ip=ip;
		}
		public  String getIpTimeRand(){
			StringBuffer sb=new StringBuffer();
			//拆分ip地址
			if(ip!=null){
				String[] split = ip.split("\\.");
				for(int i=0;i<split.length;i++){
					
							
					for (int j = 3; j >split[i].length();) {

							split[i]=	new StringBuffer(split[i]).insert(0, "0").toString();
						
					}
				
					sb.append(split[i]);
			
				}
			
			}
			//获取时间
			Date date=new Date();
			sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String dat = sdf.format(date);
			sb.append(dat);
	
			//获取三位随机数
		for(int i=0;i<3;i++){
				sb.append((int)(Math.random()*10));
			}
			return sb.toString();
			
		}


}
