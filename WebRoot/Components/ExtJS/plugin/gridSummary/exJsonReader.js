Ext.ns('Ext.ux.exJsonReader');

Ext.ux.exJsonReader = Ext.extend(Ext.data.JsonReader,
{
	//footData:'aaa',
	constructor : function(meta, recordType){
		Ext.ux.exJsonReader.superclass.constructor.call(this, meta, recordType);
		this.footData =null;
	},
	readRecords : function(o){	
		this.footData=o.sumList;
		return Ext.ux.exJsonReader.superclass.readRecords.call(this,o);

	},
	getFootData : function(){
	
		return this.footData;
	}
});	