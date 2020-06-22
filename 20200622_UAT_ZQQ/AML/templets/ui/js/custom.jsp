function getButtonHtml(id,funName,show,icon,width){
	if(undefined == width){
		width = 60;
	}
	if(undefined == icon){
		icon = "";
	}
	var html = "<a class=\"l-btn l-btn-plain\" href=\"Javascript:"+funName+"('"+id+"')\" type=\"button\" style=\"width:"+width+"px\"><span class=\"l-btn-left\"><span class=\"l-btn-text "+icon+"\" style=\"padding-left: 20px;\">"+show+"</span></span></a>";
	return html;
}