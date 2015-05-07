# xml-vn-engine
A simple VN engine wrote in XML/XSL/Javascript/HTML who runs your XML file has a fully playable game.

Un simple moteur de VN écrit en XML/XSL/JS/HTML qui utilise votre fichier XML pour en faire quelque chose de jouable.

## Comment ça marche ?
J'ai fait ça de la manière la plus compréhensible possible. 

Pour écrire votre histoire à choix multiples, vous n'aurez besoin que d'un éditeur de texte ! Ceci vous permet donc 
de l'écrire où bon vous semble, quand l'inspiration vous vient : sur un téléphone, un notebook, au bureau...

Cependant, afin que vous compreniez bien comment doit être structuré votre fichier texte, vous devez comprendre 
le concept des langages balisés, comme le HTML, ou ici le XML.

Vous trouverez un exemple totalement fonctionnel qui est ici le source.xml.

## Lancer l'aventure
Pour ce faire, vous n'avez besoin que de votre navigateur internet. Aucune connexion n'est nécessaire. Téléchargez ici source.xml et style.xsl, et lancez source.xml pour commencer à jouer à l'aventure d'exemple.

## Structurer votre aventure
### Les bases
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
Ensuite, vous pouvez commencer à écrire ! Allons, l'intro n'était pas si longue.

Votre aventure sera contenue dans des balises <aventure> et </aventure>, comme ci-dessous :
```xml
<aventure>
  Votre aventure ici...
</aventure>
```

C'est le bloc qui contiendra votre aventure. Bien sûr, une aventure seule ne sert pas à grand chose. Elle doit donc contenir plusieurs évènements, sous forme de blocs, toujours :

```xml
<aventure>
	<evenement>
		Votre premier évènement...
	</evenement>
	<evenement>
		Votre deuxième évènement...
	</evenement>
</aventure>
```

### Comment structurer un évènement
Un évènement contient trois éléments essentiels, et un facultatif :
* Un identifiant unique, qui doit être un nombre (obligatoire)
* Le titre de l'évènement (obligatoire)
* Le message contenu dans l'évènement (obligatoire)
* Les différents choix (facultatif, on y reviendra un peu plus tard)

Voyez l'exemple ci-dessous :

```xml
<aventure>
	<evenement>
		<id>1</id>
		<titre>Le commencement</titre>
		<message>Bonjour, vous êtes au début de mon aventure !</message>
	</evenement>
</aventure>
```
Bravo ! Vous avez créé un évènement ! Vous pouvez lire au dessus que votre bloc "evenement" contient ses trois blocs fondamentaux, à savoir "id", "titre", et "message". Vous pouvez désormais l'afficher fièrement. Cependant, une aventure sans choix, c'est un peu triste non ? Voyons comment en faire.

### Créer des choix entre les évènements
Créer des choix dans un évènement n'est pas obligatoire. Vous pouvez très bien afficher un message sans proposer de suite. Comme pour une mort par exemple.

Pour ajouter vos choix, vous devez donc créer un bloc par choix au sein de votre évènement. Comme illustré ci dessous :
```xml
<aventure>
	<evenement>
		<id>1</id>
		<titre>Le commencement</titre>
		<message>Bonjour, vous êtes au début de mon aventure !</message>
		<choix>
			Le premier choix...
		</choix>
		<choix>
			Le deuxième choix...
		</choix>
	</evenement>
</aventure>
```
Sauf qu'un choix a besoin de deux choses pour fonctionner : une destination, et un intitulé.
* La destination correspond à l'identifiant de l'évènement cible. Quand vous cliquerez sur ce choix, où cela vous mènera ? C'est à vous de choisir vers quel évènement ce choix reconduira, en y renseignant l'identifiant de l'évènement ciblé.
* L'intitulé est le texte du choix.

Prenons un exemple de tout ce que nous avons appris :

```xml
<aventure>
	<evenement>
		<id>1</id>
		<titre>Le commencement</titre>
		<message>Bonjour, bienvenue dans mon aventure ! Que faire ?</message>
		<choix>
			<dest>2</dest>
			<intitule>Manger</intitule>
		</choix>
		<choix>
			<dest>3</dest>
			<intitule>Dormir</intitule>
		</choix>
	</evenement>
	<evenement>
		<id>2</id>
		<titre>Manger</titre>
		<message>Miam, cette pomme est géniale. Le dessert des rois.</message>
	</evenement>
	<evenement>
		<id>3</id>
		<titre>Dormir</titre>
		<message>C'est fatiguant la vie quand on est chômeur, ça fait du bien de dormir</message>
	</evenement>
</aventure>
```
Voilà ! Vous avez à présent toutes les cartes en main pour réaliser votre propre aventure !

### Comment définir l'évènement de départ
Car oui, vous ne voulez peut-être pas commencer votre aventure par le premier évènement. Pour paramétrer ceci, il vous suffit de modifier votre balise <evenement> comme ceci :
```xml
	<evenement debut="oui">
		Votre évènement...
	</evenement>
```
