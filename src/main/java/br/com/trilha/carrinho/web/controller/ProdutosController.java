package br.com.trilha.carrinho.web.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.trilha.carrinho.dao.ProdutoDao;
import br.com.trilha.carrinho.loja.infra.FileSaver;
import br.com.trilha.carrinho.loja.models.Produto;
import br.com.trilha.carrinho.loja.models.TipoPreco;

@Controller
@RequestMapping("/produtos")
public class ProdutosController {

	@Autowired
	private ProdutoDao produtoDao;
	
	@Autowired
	private FileSaver fileSaver;
	
	@RequestMapping("/form")
	public ModelAndView form (Produto produto) {
		ModelAndView modelAndView = new ModelAndView("produtos/form");
		modelAndView.addObject("tipos", TipoPreco.values());
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView edit (Produto produto) {
		List<Produto> produtos = produtoDao.listar();
		ModelAndView modelAndView = new ModelAndView("produtos/edit");
		modelAndView.addObject("produtos", produtos);
		return modelAndView;
	}
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView gravar (MultipartFile sumario, @Valid Produto produto, BindingResult result, 
			RedirectAttributes redirectAttr) {
		
		if(result.hasErrors()) {
			return form(produto);
		}
		
		String path = fileSaver.write("arquivos-sumario", sumario);
		produto.setSumarioPath(path);
		
		produtoDao.gravar(produto);
		redirectAttr.addFlashAttribute("sucesso", "Produto cadastrado com sucesso!");
		return new ModelAndView("redirect:/produtos/edit");
	}
	
	@RequestMapping("/lista")
	public ModelAndView listar() {
		List<Produto> produtos = produtoDao.listar();
		ModelAndView modelAndView = new ModelAndView("produtos/lista");
		modelAndView.addObject("produtos", produtos);
		return modelAndView;
	}
	
	@RequestMapping("/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("produtos/detalhe");
		Produto produto = produtoDao.find(id);
		modelAndView.addObject("produto", produto);
		return modelAndView;
	}
	
	
	@GetMapping("/edit/{id}")
	public String delete(@PathVariable("id") Integer id, RedirectAttributes attr) {
		produtoDao.excluir(id);
		attr.addFlashAttribute("message", "Excluído com sucesso!");
		return "redirect:/produtos/edit";
	}
	
	
	
}
