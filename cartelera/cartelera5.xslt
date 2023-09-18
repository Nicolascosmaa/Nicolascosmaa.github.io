<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" exclude-result-prefixes="array fn map math xhtml xs err" version="3.0">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="formulario">
        <html>
            <head>
                <title><xsl:value-of select="titulo"/></title>
            </head>
            <body>
                <h1><xsl:value-of select="titulo"/></h1>
                <form>
                    <xsl:apply-templates select="preguntas/pregunta"/>
                    <input type="submit" value="{boton}"/>
                </form>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="pregunta">
        <p>
            <strong><xsl:value-of select="texto"/></strong>
            <xsl:apply-templates select="opciones/opcion"/>
        </p>
    </xsl:template>

    <xsl:template match="opcion">
        <p>
            <input type="radio" name="{../../texto}" value="{.}"/>
            <xsl:choose>
                <xsl:when test="@correcta='true'">
                    <strong><xsl:value-of select="."/></strong>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </p>
    </xsl:template>
</xsl:stylesheet>