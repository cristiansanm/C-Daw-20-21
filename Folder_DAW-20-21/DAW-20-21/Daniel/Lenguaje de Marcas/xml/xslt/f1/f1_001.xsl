<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>   
        <style>
            table,tr,td,th{
                border: 1px solid black;
                border-collapse: collapse;
            }
        </style>
        <body>
            <xsl:variable name="link" select="F1/datosGranPremio/clasificacion/@logo"/>
            <xsl:variable name="link2" select="F1/datosGranPremio/bandera/@img"/>
            <table>
                
                <thead>
                    <tr>
                        <td><img style="width:30%; height=15%" src="{$link}" alt=""/></td>
                        <td colspan="4">F1 QUALIFYING CLASSIFICATION</td>
                        <td colspan="3"><xsl:value-of select="F1/datosGranPremio/clasificacion"/></td>
                        <td><img style="width:10%; height=5%" src="{$link2}"/></td>
                        <td colspan="2">#SpanishGP</td>
                    </tr>
                    <tr>
                        <th>Puesto</th>
                        <th>Piloto</th>
                        <th>Equipo</th>
                        <th>Q1 Lap Time</th>
                        <th></th>
                        <th>Q2 Lap Time</th>
                        <th></th>
                        <th>Q3 Lap Time</th>
                        <th></th>
                        <th>Diferencia</th>
                        <th>Vueltas</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="F1/parrilla/posicion">
                    <xsl:sort select="puesto" data-type="number"/>
                    <tr>
                        <td><xsl:value-of select="puesto"/></td>
                        <!-- <xsl:variable name="e1" select="@id_equipo"/>
                        <xsl:for-each select="./../../equipos/equipo"/>
                            <xsl:variable name="e2" select="@id_equipo"/>
                            <xsl:variable name="nombre" select="pilotos/piloto/@id_pilot = 1"/>
                                <xsl:if test"{$e1} = {$e2}" >
                                    <td><xsl:value-of select"{$nombre}"=></td>
                                </xsl:if>

                        </xsl:for-each> -->
                        
                        <td></td>
                        <td><xsl:value-of select="Q1/@tiempo"/></td>
                        <td>rueda</td>
                        <xsl:choose>
                            <xsl:when test="Q2/@tiempo &gt; 0" >
                            <td><xsl:value-of select="Q2/@tiempo"/></td>
                            <td>rueda</td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td></td>
                                <td></td>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="Q3/@tiempo &gt; 0" >
                                <td><xsl:value-of select="Q3/@tiempo"/></td>
                                <td>rueda</td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td></td>
                            </xsl:otherwise>
                        </xsl:choose>
                        <td></td>
                        <xsl:choose>
                            <xsl:when test="puesto &gt; 1">
                                <xsl:if test="Q3/@tiempo &gt; 0"> 
                                    <td>+<xsl:value-of select="Q1/@tiempo - Q3/@tiempo"/></td>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <td></td>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <td><xsl:value-of select="vueltas"/></td>
                    </tr>
                    </xsl:for-each> 
                </tbody>
            </table>

        </body>

        </html>
    </xsl:template>
</xsl:stylesheet>