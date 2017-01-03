package com.ssh.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.ssh.entity.ProvinceData;

public class ParseExcelUtil {
public static List<ProvinceData> parseExcel(InputStream in,String fileName) throws Exception{
	List<ProvinceData> list=new ArrayList<ProvinceData>();
	if(fileName.endsWith(".xlsx")){
		XSSFWorkbook  workbook=new XSSFWorkbook(in);
		int sheetNumbers=workbook.getNumberOfSheets();
		XSSFSheet sheet=workbook.getSheetAt(0);
		System.out.println(fileName+"总共:"+sheetNumbers+"页");
		int lastRowNums=sheet.getLastRowNum();
		for(int i=1;i<=32;i++){
			ProvinceData pd=new ProvinceData();
			Row row=sheet.getRow(i);
/*			int lastCellNums=row.getLastCellNum();*/
/*            Cell cell0=row.getCell(0); pd.setOrder(Integer.valueOf(getCellValue(cell0)));*/
            Cell cell1=row.getCell(1); pd.setProvince(getCellValue(cell1));
            Cell cell2=row.getCell(2); pd.setOpen_tough(Integer.valueOf(getCellValue(cell2)));
            Cell cell3=row.getCell(3); pd.setOpen_soft(Integer.valueOf(getCellValue(cell3)));
            Cell cell4=row.getCell(4); pd.setToday_open_tough(Integer.valueOf(getCellValue(cell4)));
            Cell cell5=row.getCell(5); pd.setToday_open_soft(Integer.valueOf(getCellValue(cell5)));
            Cell cell6=row.getCell(6); pd.setInvoke_tough(Integer.valueOf(getCellValue(cell6)));
            Cell cell7=row.getCell(7); pd.setInvoke_soft(Integer.valueOf(getCellValue(cell7)));
            Cell cell8=row.getCell(8); pd.setToday_invoke_tough(Integer.valueOf(getCellValue(cell8)));
            Cell cell9=row.getCell(9); pd.setToday_invoke_soft(Integer.valueOf(getCellValue(cell9)));
            Cell cell10=row.getCell(10); pd.setDestroy_tough(Integer.valueOf(getCellValue(cell10)));
            Cell cell11=row.getCell(11); pd.setDestroy_soft(Integer.valueOf(getCellValue(cell11)));
            Cell cell12=row.getCell(12); pd.setToday_destroy_tough(Integer.valueOf(getCellValue(cell12)));
            Cell cell13=row.getCell(13); pd.setToday_destroy_soft(Integer.valueOf(getCellValue(cell13)));
            Cell cell14=row.getCell(14); pd.setOnline_tough(Integer.valueOf(getCellValue(cell14)));
            Cell cell15=row.getCell(15); pd.setOnline_soft(Integer.valueOf(getCellValue(cell15)));
            Cell cell16=row.getCell(16); pd.setOnline_invoke_tough(Integer.valueOf(getCellValue(cell16)));
            Cell cell17=row.getCell(17); pd.setOnline_invoke_soft(Integer.valueOf(getCellValue(cell17)));
            Cell cell18=row.getCell(18); pd.setToday_up_tough(Integer.valueOf(getCellValue(cell18)));
            Cell cell19=row.getCell(19); pd.setTerminal_arrive_tough(Integer.valueOf(getCellValue(cell19)));
            Cell cell20=row.getCell(20); pd.setInvoke_rate(Float.parseFloat(getCellValue(cell20)));
            Cell cell21=row.getCell(21); pd.setWatching_user_tough(Integer.valueOf(getCellValue(cell21)));
            Cell cell22=row.getCell(22); pd.setWatching_user_soft(Integer.valueOf(getCellValue(cell22)));
            
            list.add(pd);
/*            System.out.print(pd.getOrder());
            System.out.print(pd.getProvince());
            System.out.print(pd.getOpen_tough());
            System.out.print(pd.getOpen_soft());
            System.out.print(pd.getToday_open_tough());
            System.out.print(pd.getToday_open_soft());
            System.out.print(pd.getInvoke_tough());
            System.out.print(pd.getInvoke_soft());
            System.out.print(pd.getToday_invoke_tough());
            System.out.print(pd.getToday_invoke_soft());
            System.out.print(pd.getDestroy_tough());
            System.out.print(pd.getDestroy_soft());
            System.out.print(pd.getToday_destroy_tough());
            System.out.print(pd.getToday_destroy_soft());
            System.out.print(pd.getOnline_tough());
            System.out.print(pd.getOnline_soft());
            System.out.print(pd.getOnline_invoke_tough());
            System.out.print(pd.getOnline_invoke_soft());
            System.out.print(pd.getToday_up_tough());
            System.out.print(pd.getTerminal_arrive_tough());
            System.out.print(pd.getInvoke_rate());
            System.out.print(pd.getWatching_user_tough());
            System.out.println(pd.getWatching_user_soft());*/

		}
		if(list.size()==32&&list.get(31).getWatching_user_soft()!=null){
			return list;
		}
		else{
			return null;
		}
		
		
	}else{
		
		return null;
	}
	

	
}
public static String getCellValue(Cell cell){

	 cell.setCellType(Cell.CELL_TYPE_STRING);
	 String cellVal=cell.getStringCellValue();
     System.out.print(cellVal);
	 return cellVal;
}


}
