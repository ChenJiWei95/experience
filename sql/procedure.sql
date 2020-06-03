CREATE PROCEDURE pagination_3 
@tblName VARCHAR ( 255 ),-- 表名
@strGetFields VARCHAR ( 1000 ),-- 需要返回的列
@fldName VARCHAR ( 255 ) = "",-- 排序的字段名
@PageSize INT = 10,-- 页尺寸
@PageIndex INT = 1,-- 页码
@doCount bit = 0,-- 返回记录总数, 非 0 值则返回
@OrderType bit = 0,-- 设置排序类型, 非 0 值则降序
@strWhere VARCHAR ( 1500 ) = "" -- 查询条件 (注意: 不要加 where)
AS DECLARE
	@strSQL VARCHAR ( 5000 ) -- 主语句
DECLARE
	@strTmp VARCHAR ( 110 ) -- 临时变量
DECLARE
	@strOrder VARCHAR ( 400 ) -- 排序类型
IF @doCount != 0 
	BEGIN
		IF @strWhere != "" 
			SET @strSQL = "select count(*) as Total from [" + @tblName + "] where " + @strWhere 
		ELSE 
			SET @strSQL = "select count(*) as Total from [" + @tblName + "]" 
	END 
--以上代码的意思是如果 @doCount传递过来的不是 0，就执行总数统计。以下的所有代码都是 @doCount为 0的情况： --e lse --b egin

IF @OrderType != 0 
	BEGIN
		SET @strTmp = "<(select min" 
		SET @strOrder = " order by [" + @fldName + "] desc" --如果 @OrderType不是 0，就执行降序，这句很重要！ 
	END 
ELSE  
	BEGIN 
		SET @strTmp = ">(select max" 
		SET @strOrder = " order by [" + @fldName + "] asc" 
	END 
	
IF @PageIndex = 1 
	BEGIN
		IF @strWhere != "" 
			SET @strSQL = "select top " + str ( @PageSize ) + " " + @strGetFields + " from [" + @tblName + "] where " + @strWhere + "  " + @strOrder 
		ELSE 
			SET @strSQL = "select top " + str ( @PageSize ) + " " + @strGetFields + "  from [" + @tblName + "] " + " " + @strOrder 
	END 
--如果是第一页就执行以上代码，这样会加快执行速度 
ELSE 
--以下代码赋予了 @strSQL以真正执行的 SQL代 
	BEGIN
		SET @strSQL = "select top " + str ( @PageSize ) + " " + @strGetFields + " from [" + @tblName + "] where [" + @fldName + "]" + @strTmp + "([" + @fldName + "]) from (select top " + str ( ( @PageIndex - 1 ) * @PageSize ) + " [" + @fldName + "] from [" + @tblName + "]" + @strOrder + ") as tblTmp)" + @strOrder
		IF @strWhere != "" 
			SET @strSQL = "select top " + str ( @PageSize ) + " " + @strGetFields + " from [" + @tblName + "] where [" + @fldName + "]" + @strTmp + "([" + @fldName + "]) from (select top " + str ( ( @PageIndex - 1 ) * @PageSize ) + " [" + @fldName + "] from [" + @tblName + "] where " + @strWhere + " " + @strOrder + ") as tblTmp) and " + @strWhere + " " + @strOrder 
	END
exec ( @strSQL ) 
GO


select top 10 * 
	from [user] 
	where [id] < (
		select min ([id]) 
		from (
			select top 0 [id] 
			from [user] order by [id] desc) 
				as tblTmp) order by [id] desc
				
				
				
SELECT
	top 10 * 
FROM
	[ member ] 
WHERE
	[ id ] < (
	SELECT
		min( [ id ] ) 
	FROM
		( SELECT top 0 [ id ] FROM [ member ] ORDER BY [ id ] DESC ) AS id 
		) 
	ORDER BY
		[ id ] DESC