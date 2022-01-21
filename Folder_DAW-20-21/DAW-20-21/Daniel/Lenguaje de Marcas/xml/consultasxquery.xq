
<table>
  <tr><th>Titulos</th></tr>
  
    {
      for $lib in (/bookstore/book/author) 
      return
      <tr><td>{data($lib)}</td></tr>
    }
  
</table>
  


