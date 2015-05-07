<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output 
  method="html"
  encoding="UTF-8"
  doctype-public="-//W3C//DTD HTML 4.01//EN"
  doctype-system="http://www.w3.org/TR/html4/strict.dtd"
  indent="yes" />
  
<xsl:template match="/">
	<xsl:apply-templates select="aventure" />
</xsl:template>
<!-- <xsl:template match="aventure">
<xsl:apply-templates select="evenement" />
</xsl:template> -->

<xsl:template match="aventure">
<html>
<head>
    <title>Bonjour</title>
	<meta charset="UTF-8" />
	<style>
			html {
				margin:0px;
				width:100%;
				height:100%;
			}

			body {
				font-family: Helvetica;
				height: 100%;
				width: 100%;
				margin: 0;
				padding: 0;
				display: table;
			}

			p {
				text-align: center;
			}

			section.texte {
				display: table-row;
				height: 80%;
				width: 100%;
			}

			p.texte {
				display: table-cell;
				vertical-align: middle;
				background-color: #8ACDFF;
			}

			section {
				display: table-row;
				height: 15%;
				width: 100%;
				font-size: 16pt;
			}

			p.choix {
				display: table-cell;
				background-color: #B276FF;
				vertical-align: middle;
				width: 100%;
			}
			
			a {
				text-decoration:none;
				color:#000000;
			}
	</style>
</head>
<body>
    <section class="texte">
		<p id="texte" class="texte"></p>
    </section>
    <section class="choix">
		<p id="choix" class="choix"></p>
    </section>
    
    <script type="text/javascript">
	<![CDATA[
    function Choix(dest, intitule){
        this.dest = dest;
        this.intitule = intitule;
    }
    
    function Evenement(id, nom, message) {
        this.id = id;
        this.nom = nom;
        this.message = message;
        this.debut = false;
    }
    
    Evenement.prototype.setChoix = function(newChoix) {
        this.choix = new Array();
        
        for(var i = 0; i < newChoix.length; i++) {
			if(newChoix[i].length == 2)
				this.choix.push(new Choix(newChoix[i][0], newChoix[i][1]));
		}
    }
        
    Evenement.prototype.setDebut = function() {
        this.debut = true;
    }
        
    Evenement.prototype.unsetDebut = function() {
        this.debut = false;
    }

    function Aventure(evenementsToAdd) {
        // Optimisation des clés dans le tableau
        this.evenements = new Array();
	
        for(i = 0; i < evenementsToAdd.length; i++) {
            this.evenements[evenementsToAdd[i].id] = evenementsToAdd[i];
		}
    }

    Aventure.prototype.doesIdExists = function(id) {
        return id in this.evenements;
    }

    Aventure.prototype.getIdDebut = function() {
        for(var key in this.evenements) 
            if(this.evenements[key].debut)
                return key;
        
        // Si aucun début n'est précisé, on renvoie le premier évènement
        for(var key in this.evenements)
            return key;
    }
        
    Aventure.prototype.getEvenement = function(id) {
        return this.evenements[id];
    }
    
    
    var arrayEvenements = new Array();
	var ev;
	]]>
	</script>
	<script type="text/javascript">
		<xsl:apply-templates select="evenement" />
	</script>
	<script type="text/javascript">
	<![CDATA[
	var aventure = new Aventure(arrayEvenements);
    
    function updatePage(idEv) {
        if(aventure.doesIdExists(idEv)) {
            var texte = document.getElementById("texte");
            texte.innerHTML = "";
            var p = document.createElement("p");
            var ev = aventure.getEvenement(idEv);
            p.innerHTML = ev.message;
            texte.appendChild(p);
            
            var choix = document.getElementById("choix");
            choix.innerHTML = "";
            
            for(i = 0; i < ev.choix.length; i++) {
				if(i != 0) choix.appendChild(document.createTextNode(" | "));
				if(aventure.doesIdExists(ev.choix[i].dest)) {
					var lien = document.createElement("a");
					lien.href = "#";
					lien.setAttribute('onclick', 'updatePage(' + ev.choix[i].dest + ')');
					lien.appendChild(document.createTextNode(ev.choix[i].intitule)); 
					choix.appendChild(lien);
				} else {
					choix.appendChild(document.createTextNode(ev.choix[i].intitule));
				}
            }
        }
    }
	
    updatePage(aventure.getIdDebut());
      ]]>  
    </script>
	
</body>
</html> 
</xsl:template>

<xsl:template match="evenement">
	ev = new Evenement(<xsl:value-of select="id" />,"<xsl:value-of select="titre" />","<xsl:value-of select="message" />");
	<xsl:if test="choix">
		ev.setChoix([<xsl:apply-templates select="choix" />[]]);
	</xsl:if>
	<xsl:if test="@debut">
		ev.setDebut();
	</xsl:if>
	arrayEvenements.push(ev);
</xsl:template>
<xsl:template match="choix">
	[<xsl:value-of select="dest" />, "<xsl:value-of select="intitule" />"],
</xsl:template>
</xsl:stylesheet>
