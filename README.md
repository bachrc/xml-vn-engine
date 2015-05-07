# xml-vn-engine
A simple VN engine wrote in XML/XSL/Javascript/HTML who runs your XML file has a fully playable game.

Un simple moteur de VN écrit en XML/XSL/JS/HTML qui utilise votre fichier XML pour en faire quelque chose de jouable.

## Comment ça marche ?
J'ai fait ça de la manière la plus compréhensible possible. 

Pour écrire votre histoire à choix multiples, vous n'aurez besoin que d'un éditeur de texte ! Ceci vous permet donc 
de l'écrire où bon vous semble, quand l'inspiration vous vient : sur un téléphone, un notebook, au bureau...

Cependant, afin que vous compreniez bien comment doit être structuré votre fichier texte, vous devez comprendre 
le concept des langages balisés, comme le HTML, ou ici le XML.

Vous trouverez un exemple totalement fonctionnel qui est ici le source.xml

Tout d'abord, votre fichier de texte doit être au format XML. Appelez-le comme bon vous semble : jeu.xml, dessert.xml...
Ensuite, n'oubliez pas de coller ceci au début de votre fichier XML : 
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<?xml-stylesheet type="text/xsl" href="style.xsl"?>
<!DOCTYPE aventure [
	<!ELEMENT aventure (evenement+)>
		<!ELEMENT evenement (id, titre, message, choix*)>
		<!ATTLIST evenement	debut (oui) #IMPLIED>
			<!ELEMENT id (#PCDATA)>
			<!ELEMENT titre (#PCDATA)>
			<!ELEMENT message (#PCDATA)>
			<!ELEMENT choix (dest, intitule)>
				<!ELEMENT dest (#PCDATA)>
				<!ELEMENT intitule (#PCDATA)>
]>
```
## Structurer votre aventure

Ensuite, vous pouvez commencer à écrire ! Allons, l'intro n'était pas si longue.

Votre aventure sera contenue dans des balises <aventure> et </aventure>, comme ci-dessous :
```xml
<aventure>
  Votre aventure ici...
</aventure>
```

C'est le bloc qui contiendra votre aventure. (je sauvegarde mdr)
