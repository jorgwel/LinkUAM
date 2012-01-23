/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.uam.azc.link.action.ejemplos;

import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;

/**
 *
 * @author jorgwel
 */
@Name("collectorBean")
@Scope(ScopeType.CONVERSATION)
public class CollectorBean {

	//    private Book book = new Book();
	private Book book;
	private Book libroParaEliminar;

	private List<Book> books = new ArrayList<Book>();

	public String reinit() {
		book = new Book();

		return null;
	}

	public Book getBook() {
		if (book == null) {
			book = new Book();
		}
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

}