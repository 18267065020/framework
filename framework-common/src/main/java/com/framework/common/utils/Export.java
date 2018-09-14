package com.framework.common.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;


public class Export {
	
	
	
	
	
	public static void setUpExcel(String[] headers, List<Map<String,Object>> datasList, HttpServletRequest request, HttpServletResponse response,String excelName) throws IOException{
		// TODO Auto-generated method stub
		//Strin g[] headers = { "资料标题", "类别","作者","添加时间","点击数"};
	        HSSFWorkbook workbook = new HSSFWorkbook();
	        HSSFSheet sheet = workbook.createSheet();
	        //设置列宽
	        sheet.setDefaultColumnWidth((short) 18);
	        //创建第一行的对象，第一行一般用于填充标题内容。从第二行开始一般是数据
	        HSSFRow row = sheet.createRow(0);
	        for (short i = 0; i < headers.length; i++) {
	            //创建单元格，每行多少数据就创建多少个单元格
	            HSSFCell cell = row.createCell(i);
	            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
	            //给单元格设置内容
	            cell.setCellValue(text);
	        }

	        //遍历集合，将每个集合元素对象的每个值填充到单元格中
	       for(int i=0;i<datasList.size();i++){
	    	   datasList.get(i);
	           //从第二行开始填充数据
	           row = sheet.createRow(i+1);
	           //该集合只记录数量和时间，这两个值来自statisticsModel。如果对象比较复杂，需要额外转换，比如Date类型的日期，int，float类型的数值
	           List<String> datas=new ArrayList<>();
	           for (short j = 0; j < headers.length; j++) {
	        	   
	           String data=datasList.get(i).get(headers[j])==null?"":datasList.get(i).get(headers[j]).toString();
	           datas.add(data);
	        		   
	           }
	          
	           for (int j=0;j<datas.size();j++) {
	               String string=datas.get(j);
	               HSSFCell cell = row.createCell(j);
	               HSSFRichTextString richString = new HSSFRichTextString(string);
	               HSSFFont font3 = workbook.createFont();
	               //定义Excel数据颜色，这里设置为
	               font3.setColor(HSSFColor.BLACK.index);
	               richString.applyFont(font3);
	               cell.setCellValue(richString);
	        }

	       }

	       response.setContentType("application/octet-stream");
	       response.setHeader("Content-disposition", "attachment;filename="+excelName+".xls");//Excel文件名
	       try {
	            response.flushBuffer();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	       //将workbook中的内容写入输出流中
	       workbook.write(response.getOutputStream());

	}

}
