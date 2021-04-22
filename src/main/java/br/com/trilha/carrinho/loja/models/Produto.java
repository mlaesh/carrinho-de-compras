package br.com.trilha.carrinho.loja.models;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Produto {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	@NotBlank
	@Size (min = 3, max = 50)
	private String titulo;
	
	@NotBlank
	@Size (min = 10, max = 800)
	@Lob
	private String descricao;
	
	@NotNull
	private Integer paginas;
	
	@ElementCollection
	private List<Precos> precos;
	
	private String sumarioPath;
	
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Integer getPaginas() {
		return paginas;
	}
	public void setPaginas(Integer paginas) {
		this.paginas = paginas;
	}
		
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public List<Precos> getPrecos() {
		return precos;
	}
	public void setPrecos(List<Precos> precos) {
		this.precos = precos;
	}
	public String getSumarioPath() {
		return sumarioPath;
	}
	public void setSumarioPath(String sumarioPath) {
		this.sumarioPath = sumarioPath;
	}
	@Override
	public String toString() {
		return "produto [titulo=" + titulo + ", descricao=" + descricao + ", paginas=" + paginas + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Produto other = (Produto) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	public BigDecimal precoPara(TipoPreco tipoPreco) {
		return precos.stream().filter(preco -> preco.getTipo().equals(tipoPreco)).findFirst()
				.get().getValor();
	}

	
}
