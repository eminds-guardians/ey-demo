source(output(
		name as string,
		author as string,
		narrator as string,
		time as string,
		releasedate as string,
		language as string,
		stars as string,
		price as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	format: 'table') ~> source1
source1 derive(author = replace(author,"Writtenby:",''),
		narrator = replace(narrator,'Narratedby:',''),
		stars = replace(stars,"Not rated yet",'0'),
		ratings = split(stars,' ')[5],
		time = replace(time,'and', ':')) ~> derivedColumn1
derivedColumn1 derive(stars = split(stars, " ")[1],
		ratings = replace(ratings,"stars",''),
		releasedate = toString(toDate(releasedate, 'dd-MM-yyyy'),'dd/MM/20yy')) ~> derivedColumn2
derivedColumn2 derive(ratings = iifNull(ratings,'0',''),
		releasedate = toDate(releasedate,'dd/MM/yyyy'),
		price = replace(price, '.00', '')) ~> derivedColumn3
derivedColumn3 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		name as string,
		author as string,
		narrator as string,
		time as string,
		releasedate as date,
		language as string,
		stars as string,
		price as string,
		ratings as string
	),
	deletable:false,
	insertable:true,
	updateable:false,
	upsertable:false,
	format: 'table',
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError') ~> sink1