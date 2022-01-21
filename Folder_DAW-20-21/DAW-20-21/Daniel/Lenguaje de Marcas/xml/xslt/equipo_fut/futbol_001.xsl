<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <style>
            table, th, td{
                border: 1px black solid;
                border-collapse: collapse;
            }
            table{
                width: 50%;
            }
            th{
                background-color: purple;
                color: white;
            }
        </style>
        <body>
            <h2>Equipos de futbol</h2>
            <table>
                <tr>
                    <th>Equipo</th>
                    <th>G.F</th>
                    <th>G.C</th>
                    <th>Puntos</th>
                </tr>
                
                <xsl:for-each select="equipos/equipo">
                    <xsl:sort select="puntos" data-type="number" order="descending"/>
                    <xsl:sort select="golesafavor" data-type="number" order="descending"/>
                    <xsl:sort select="golescontra" data-type="number" order="ascending"/>
                    
                    <tr>
                        <xsl:choose>
                            <xsl:when test="position() &lt; 5">
                                <td style="background-color: green;"><xsl:value-of select="nombre"/></td>
                                <td style="background-color: green;"><xsl:value-of select="golesafavor"/></td>
                                <td style="background-color: green;"><xsl:value-of select="golescontra"/></td>
                                <td style="background-color: green;"><xsl:value-of select="puntos"/></td>
                            </xsl:when>
                            <xsl:when test="position() &gt; last()-3">
                                <td style="background-color: red;"><xsl:value-of select="nombre"/></td>
                                <td style="background-color: red;"><xsl:value-of select="golesafavor"/></td>
                                <td style="background-color: red;"><xsl:value-of select="golescontra"/></td>
                                <td style="background-color: red;"><xsl:value-of select="puntos"/></td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td><xsl:value-of select="nombre"/></td>
                                <td><xsl:value-of select="golesafavor"/></td>
                                <td><xsl:value-of select="golescontra"/></td>
                                <td><xsl:value-of select="puntos"/></td>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        
                    </tr>
                </xsl:for-each>
            </table>
        </body>

        </html>
    </xsl:template>
</xsl:stylesheet>