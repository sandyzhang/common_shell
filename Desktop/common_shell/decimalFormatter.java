public class DecimalFormatTool {
	
	//每3位中间添加逗号的格式化显示
	public static String getCommaFormat(BigDecimal value){
		return getFormat(",###.##",value);
	}
	
	//自定义数字格式方法
	public static String getFormat(String style,BigDecimal value){
		DecimalFormat df = new DecimalFormat();
		df.applyPattern(style);// 将格式应用于格式化器
		return df.format(value.doubleValue());
	}
	
	public static void main(String[] args) {
		System.out.println(DecimalFormatTool.getCommaFormat(new BigDecimal(0.5)));
	}
	
}