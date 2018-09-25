package com.js.application.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.fr.base.core.UUID;
import com.js.application.model.TableDescribe;

/**
 * 读取excel文件
 * @author superC
 *
 */
public class ReadExcel {

	
	/**
	 * 读取xls文件，获取数据	---存储至数据库
	 * @param excelPath	excel文件路径
	 * @param tbList	所需表标识符集合
	 * @return	所需数据集合
	 */
	public List<TableDescribe> readXls(String excelPath,List<String> tbList){
		//--所需数据集合
		List<TableDescribe> list = new ArrayList<TableDescribe>();
		
		InputStream is = null;
		try {
			is = new FileInputStream(excelPath);
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
			// 循环工作表Sheet
	        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
	        	//获取sheet
	        	HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
	        	if (hssfSheet == null) {
	        	    continue;
	        	}
	        	//-- 循环行Row（从2开始，0为标题，1为表头，不取）
	        	for (int rowNum = 2; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
	        		//行
	        		HSSFRow hssfRow = hssfSheet.getRow(rowNum);
	        		if (hssfRow == null) {
	                    continue;
	                }
	        		//--遍历所需要获取的表标识符列表
					for (String tb : tbList) {
						if(StringUtils.isNotBlank(tb)){
							
							TableDescribe td = getCell(hssfRow,tb);//表描述信息
							if(td!=null){
								list.add(td);
							}
						}
					}
	        		
	        	}//row for ---end

	        }//sheet for ---end
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	/**
	 * 读取xls文件，获取数据	------存入doc模板中
	 * @param excelPath	excel文件路径
	 * @param tbList	所需表标识符集合
	 * @return	所需数据集合
	 */
	public Map<String, Object> readXlsToDoc(String excelPath,List<String> tbList){
		//--所需数据集合
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<TableDescribe> ideAndNmList = new ArrayList<TableDescribe>();//表名、表标识符
		List<TableDescribe> dataList = new ArrayList<TableDescribe>();//所有字段
		InputStream is = null;
		try {
			is = new FileInputStream(excelPath);
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
			// 循环工作表Sheet
			for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
				//获取sheet
				HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
				if (hssfSheet == null) {
					continue;
				}
				//--遍历所需要获取的表标识符列表
				for (String tb : tbList) {
					if(StringUtils.isNotBlank(tb)){
						TableDescribe ideAndNm = new TableDescribe();
						String fieldname = "";
						//-- 循环行Row（从2开始，0为标题，1为表头，不取）
						for (int rowNum = 2; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
							//行
							HSSFRow hssfRow = hssfSheet.getRow(rowNum);
							if (hssfRow == null) {
								continue;
							}
							
							TableDescribe td = getCell(hssfRow,tb);//表描述信息
							if(td!=null){
								dataList.add(td);
								if(fieldname==""){
									fieldname = td.getFieldname();
								}
							}
						}//row for ---end
//						dataMap.put(tb, dataList);//将所有该表标识符匹配的数据，存入map<表标识符,数据集合>
						dataMap.put("dataList", dataList);//将所有该表标识符匹配的数据，存入map<表标识符,数据集合>
						ideAndNm.setTableIdent(tb);
						ideAndNm.setFieldname(fieldname);
						ideAndNmList.add(ideAndNm);//若所需表标识符有数据，则存入list
					}
				}//表标识符for ---end
				
			}//sheet for ---end
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		dataMap.put("ideAndNmList", ideAndNmList);
		return dataMap;
	}
	
	/**
	 *	--获取每行中每个单元格数据
	 * @param hssfRow	行数据
	 */
	private TableDescribe getCell(HSSFRow hssfRow, String tb){
		//获取表标识符
		HSSFCell tableIdent = hssfRow.getCell(7);
		String ident = "";//表标识符
		boolean flag = false;//是否为所需要的数据
		if (tableIdent != null) {
			ident = getValue(tableIdent);
			if(StringUtils.isNotBlank(ident)){
				//判断是否为所需数据
				if(ident.equalsIgnoreCase(tb)){
					flag = true;//存储该行数据
				}
			}
		}
		if(flag){
			
			TableDescribe td = new TableDescribe();
			td.setTableIdent(ident);
			
			/*
			 * --获取每个单元格
			 */
			HSSFCell name = hssfRow.getCell(6);//表名
			HSSFCell index = hssfRow.getCell(8);//序号
			HSSFCell fieldName = hssfRow.getCell(9);//字段名
			HSSFCell fieldIdent = hssfRow.getCell(10);//字段标识
			HSSFCell charLength = hssfRow.getCell(11);//类型及长度
			HSSFCell isNull = hssfRow.getCell(12);//可否为空
			HSSFCell unit = hssfRow.getCell(13);//计量单位
			HSSFCell pk = hssfRow.getCell(14);//主键
			HSSFCell refNum = hssfRow.getCell(15);//索引号
			
			if (name != null) {
				td.setTableName(getValue(name));
			}
			//--由于该数字为序号，所以我们需要将double转换为int
			if (index != null) {
				if(index.getCellType() == HSSFCell.CELL_TYPE_NUMERIC){//数字（double）
					double value = index.getNumericCellValue();
					System.out.println(value);
					td.setIndexnum(new Integer((int) value));//强转为int,再转Integer
				}
			}
			if (fieldName != null) {
				td.setFieldname(getValue(fieldName));
			}
			if (fieldIdent != null) {
				td.setFieldident(getValue(fieldIdent));
			}
			if (charLength != null) {
				td.setCharlength(getValue(charLength));
			}
			if (isNull != null) {
				td.setIsnull(getValue(isNull));
			}
			if (unit != null) {
				td.setUnit(getValue(unit));
			}
			if (pk != null) {
				td.setPk(getValue(pk));
			}
			if (refNum != null) {
				if(refNum.getCellType() == HSSFCell.CELL_TYPE_NUMERIC){//数字（double）
					double value = refNum.getNumericCellValue();
					td.setRefnum(new Integer((int) value));//强转为int
				}
			}
			
			return td;   
		}//flag ---end
		else{
			return null;
		}
	}
	
	/**
	 * 获取单元格中的数据
	 */
	@SuppressWarnings("unused")
	private String getValue(HSSFCell hssfCell) {
		if (hssfCell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN) {
		    // 返回布尔类型的值
		    return String.valueOf(hssfCell.getBooleanCellValue());
		} else if (hssfCell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
		    // 返回数值类型的值
		    return String.valueOf(hssfCell.getNumericCellValue());
		} else {
		    // 返回字符串类型的值
		    return String.valueOf(hssfCell.getStringCellValue());
		}
	}
	
	
}
