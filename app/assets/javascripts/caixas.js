TRNs = {
	selecionaCaixa: function(id){
		$('ul.abas_caixas li').removeClass('ativa');
		$('div.aba_caixa').hide();
		$('ul.abas_caixas li#'+id).addClass('ativa');
		$('div.aba_caixa[id='+id+']').show();
	},
	
	exibeResultadoCaixa: function(caixa){
		var div = $('div#bater_caixa_'+caixa);
		var tenho = parseFloat(div.find('input#tenho').val())
		if(!tenho){return}
		
		var saldo_atual = parseFloat(div.attr("saldo_atual"));
		var resultado = (tenho - saldo_atual).toFixed(2)
		
		var html = div.find('#link_base').html().replace(/resultado/g,resultado);
		
		div.find('#resultado').html(html);
	},
	
	pisca: function(id){
		var t = $('table.transacoes tr.transacao#'+id);
		if(!t){return}
		window.scrollTo(0,(t.offset().top - 50));
		t.addClass('atencao');
		setTimeout(function(){t.removeClass('atencao')},2000);
	}
};