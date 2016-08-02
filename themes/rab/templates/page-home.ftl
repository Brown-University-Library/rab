<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<@widget name="login" include="assets" />
<#import "lib-home-page.ftl" as lh>

<!DOCTYPE html>
<html lang="en">
    <head>
        <#include "head.ftl">
        <script type="text/javascript" src="${urls.base}/js/infinite-rotator.js"></script>
        <!-- scripts for Google Ajax Feed API -->
        <script type="text/javascript" src="//www.google.com/jsapi?key=ABQIAAAAl69hMrMPX0hsLyE93DVyTxQBzqpr8JnUHHa00_iYLABa7Jl01hTPFSyvAN6p4kjiYtcotcoxMszxSw"></script>

        <script type="text/javascript">
        google.load("feeds", "1") //Load Google Ajax Feed API (version 1)
        </script>
        <style type="text/css">
          #wrapper-content {
            min-height: 650px;
          }
          .researchers-title {
            color:#c00404;
            font-size: 1.35em;
          }

          .news-item-box {
            background:#aba698;
          }

          .news-item-title {
            margin-left:10px;
            font-family:Georgia,Times,serif;
            font-size:1em;
            font-weight:bold;
            color:white;
            text-transform:uppercase;
          }

          p.more-news {
            float:right;
            margin-top:-20px;
            font-size: .85em;
          }

          a.more-news {
            color:#645e50;
          }
          li.rss-item {
            color: #ffffff;
            /*list-style-image:url(./themes/researchers-brown/images/bullet-orange.png);*/
            margin-bottom: 1.0em;
            margin-left: 1.6em;
          }

          a.rss-item {
            font-size: .90em;
            line-height: 1.0em;
            color: #ffffff;
            text-decoration: none;
            border-bottom: 1px dotted ##645e50;
            font-weight: normal;
          }

          a:hover.rss-item {
            font-size: .90em;
            line-height: 1.0em;
            color: #645e50;
            text-decoration: none;
            font-weight: normal;
          }

          .rss-box {
            clear: both;
          }

          #rotating-item-wrapper {
          	position: relative;
          	width: 200px;
          	height: 225px;
          }
          .rotating-item {
          	display: none;
          	position: absolute;
          	top: 0;
          	left: 75px;

          }

          p.viewprofile {
          	font-size: .85em;
          	text-align:center;
          }
          </style>
    </head>
    
    <body class="${bodyClasses!}">
        <#include "identity.ftl">
	<#include "search.ftl">        
        <#include "menu.ftl">
      <section id="intro" role="region">
            <h2><span class="researchers-title">Welcome to Researchers@Brown</span></h2>
                  <p>Researchers@Brown brings together, in one site, publicly available information on the people, departments, and activities that collectively make up research and scholarship in all disciplines at Brown University.</p>
          <hr />
                   
                   <ul style="list-style:disc;margin-left:50px;">For FACULTY:
                      <li>You may have harvested publications pending approval. <br /> <span style="font-size:small">Click "Manage your profile" -> "Publications" -> "Manage publications".</span><br /><br /></li>
                      <li>Check out the new "Geographic Research Area" section which uses a standard set of geographic terms.<br /><br /></li>
                      <li>Coming soon! Optional network visualizations<br /><br /></li> 
                   </ul>
                      <hr />            
                   <ul style="list-style:disc;margin-left:50px;">For DEVELOPERS: 
                   <li>The R@B team has developed a <a href="http://library.brown.edu/DigitalTechnologies/announcing-a-researchers-brown-data-service/">JSON web service</a> that makes it easy to use data from Researchers@Brown in other websites.<br /><br /></li>
                   </ul>            
                   <hr />             
                  <p>Please provide feedback or request help by contacting <a href="mailto:researchers@brown.edu">researchers@brown.edu</a>. Visit our <a href="./help">Help</a> pages for further information.</p>
          </section>
          
          <section id="login" class="news-item-box">
         
                         <p></p>
                                    <p class="news-item-title">Recent Faculty Books </p>
                                      <div id="rotating-item-wrapper">

      <a href="./display/mgutmann"><img src="./themes/rab/images/books/mgutmann.jpg" alt="Breaking Ranks by Matthew C. Gutmann" title="Breaking Ranks: Iraq Veterans Speak Out against the War" class="rotating-item" height="225" /></a>

      <a href="./display/stobin"><img src="./themes/rab/images/books/stobin.jpg" alt="Everyday Piety by Sara A. Tobin" title="Everyday Piety: Islam and Economy in Jordan" class="rotating-item" height="225" /></a>

      <a href="./display/gwood"><img src="./themes/rab/images/books/gwood.jpg" alt="The Idea of America by Gordon S. Wood" title="The Idea of America: Reflections on the Birth of the United States" class="rotating-item" height="225" /></a>

      <a href="./display/miwhite"><img src="./themes/rab/images/books/miwhite.jpg" alt="Achieving Anew by Michael J. White and Jennifer E. Glick" title="Achieving Anew: How New Immigrants Do in American Schools, Jobs, and Neighborhoods" class="rotating-item" height="225" /></a>

      <a href="./display/rcschnei"><img src="./themes/rab/images/books/rcschnei.jpg" alt="Theatre & History by Rebecca Schneider" title="Theatre & History" class="rotating-item" height="225" /></a>

      <a href="./display/tlrose"><img src="./themes/rab/images/books/tlrose.jpg" alt="Longing to Tell by Tricia Rose" title="Longing to Tell: Black Women Talk About Sexuality and Intimacy" class="rotating-item" height="225" /></a>

      <a href="./display/srockman"><img src="./themes/rab/images/books/srockman.jpg" alt="Scraping By: Wage Labor, Slavery and Survival in Early Baltimore by Seth Rockman" title="Scraping By: Wage Labor, Slavery and Survival in Early Baltimore" class="rotating-item" height="225" /></a>

      <a href="./display/mputnam"><img src="./themes/rab/images/books/mputnam.jpg" alt="The Humanness of Heroes by Michael C. J. Putnam" title="The Humanness of Heroes: Studies in the Conclusion of Virgil's Aeneid" class="rotating-item" height="225" /></a>

      <a href="./display/jtpatter"><img src="./themes/rab/images/books/jtpatter.jpg" alt="The Eve of Destruction by James T. Patterson" title="The Eve of Destruction: How 1965 Transformed America" class="rotating-item" height="225" /></a>

      <a href="./display/dmumford"><img src="./themes/rab/images/books/dmumford.jpg" alt="Indra's Pearls: The Vision of Felix Klein by David Mumford" title="Indra's Pearls: The Vision of Felix Klein" class="rotating-item" height="225" /></a>

      <a href="./display/kemiller"><img src="./themes/rab/images/books/kemiller.jpg" alt="Only a Theory by Kenneth R. Miller" title="Only a Theory: Evolution and the Battle for America's Soul" class="rotating-item" height="225" /></a>

      <a href="./display/plieberm"><img src="./themes/rab/images/books/plieberm.jpg" alt="The Unpredictable Species: What Makes Humans Unique by Philip Lieberman" title="The Unpredictable Species: What Makes Humans Unique" class="rotating-item" height="225" /></a>

      <a href="./display/clarmore"><img src="./themes/rab/images/books/clarmore.jpg" alt="The Practices of the Self by Charles Larmore" title="The Practices of the Self" class="rotating-item" height="225" /></a>

      <a href="./display/jkhalip"><img src="./themes/rab/images/books/jkhalip.jpg" alt="Releasing the Image edited by Jacques Khalip and Robert Mitchell" title="Releasing the Image: From Literature to New Media" class="rotating-item" height="225" /></a>

      <a href="./display/jitzigso"><img src="./themes/rab/images/books/jitzigso.jpg" alt="Encountering American Faultlines by José Itzigsohn" title="Encountering American Faultlines: Race, Class, and the Dominican Experience in Providence" class="rotating-item" height="225" /></a>

      <a href="./display/mharper"><img src="./themes/rab/images/books/mharper.jpg" alt="Use Trouble by Michael Harper" title="Use Trouble" class="rotating-item" height="225" /></a>

      <a href="./display/cfrank"><img src="./themes/rab/images/books/cfrank.jpg" alt="Objectifying China, Imagining America by Caroline Frank" title="Objectifying China, Imagining America: Chinese Commodities in Early America" class="rotating-item" height="225" /></a>

      <a href="./display/tfield"><img src="./themes/rab/images/books/tfield.jpg" alt="Bird Lovers, Backyard by Thalia Field" title="Bird Lovers, Backyard" class="rotating-item" height="225" /></a>

      <a href="./display/destlund"><img src="./themes/rab/images/books/destlund.jpg" alt="Democratic Authority by David M. Estlund" title="Democratic Authority: A Philosophical Framework" class="rotating-item" height="225" /></a>

      <a href="./display/gelliott"><img src="./themes/rab/images/books/gelliott.jpg" alt="Family Matters by Gregory C. Elliott" title="Family Matters: The Importance of Mattering to Family in Adolescence" class="rotating-item" height="225" /></a>

      <a href="./display/cdelaney"><img src="./themes/rab/images/books/cdelaney.jpg" alt="Columbus and the Quest for Jerusalem by Carol Delaney" title="Columbus and the Quest for Jerusalem: How Religion Drove the Voyages that Led to America" class="rotating-item" height="225" /></a>

      <a href="./display/mguterl"><img src="./themes/rab/images/books/mguterl.jpg" alt="Josephine Baker and the Rainbow Tribe by Matthew Guterl" title="Josephine Baker and the Rainbow Tribe" class="rotating-item" height="225" /></a>

      <a href="./display/lbraun"><img src="./themes/rab/images/books/lbraun.jpg" alt="Breathing Race into the Machine by Lundy Braun" title="Breathing Race into the Machine: The Surprising Career of the Spirometer from Plantation to Genetics" class="rotating-item" height="225" /></a>

      <a href="./display/abenton"><img src="./themes/rab/images/books/abenton.jpg" alt="HIV Exceptionalism by Adia Benton" title="HIV Exceptionalism: Development through Disease in Sierra Leone" class="rotating-item" height="225" /></a>

      <a href="./display/fgander"><img src="./themes/rab/images/books/fgander.jpg" alt="The Trace by Forrest Gander" title="The Trace" class="rotating-item" height="225" /></a>

      <a href="./display/clutz"><img src="./themes/rab/images/books/clutz.jpg" alt="Schooled by Anne Lutz Fernandez and Catherine Lutz" title="Schooled: Ordinary, Extraordinary Teaching in an Age of Change" class="rotating-item" height="225" /></a>

      <a href="./display/mredfiel"><img src="./themes/rab/images/books/mredfiel.jpg" alt="Theory at Yale by Marc Refield" title="Theory at Yale: The Strange Case of Deconstruction in America" class="rotating-item" height="225" /></a>

      <a href="./display/hchudaco"><img src="./themes/rab/images/books/hchudaco.jpg" alt="Changing the Playbook by Howard Chudacoff" title="Changing the Playbook: How Power, Profit, and Politics Transformed College Sports" class="rotating-item" height="225" /></a>

      <a href="./display/tbewes"><img src="./themes/rab/images/books/bewes.jpg" alt="The Event of Postcolonial Shame by Timothy Bewes" title="The Event of Postcolonial Shame" class="rotating-item" height="225" /></a>
                  
      <a href="./display/rcoover"><img src="./themes/rab/images/books/coover.jpg" alt="The Brunist Day of Wrath by Robert Coover" title="The Brunist Day of Wrath" class="rotating-item" height="225" /></a>
                  
      <a href="./display/shouston"><img src="./themes/rab/images/books/houston.jpg" alt="The Life Within: Classic Maya and the Matter of Permanence by Stephen Houston" title="The Life Within: Classic Maya and the Matter of Permanence" class="rotating-item" height="200" /></a>
                  
      <a href="./display/kyperry"><img src="./themes/rab/images/books/perry.jpg" alt="Black Women against the Land Grab by Keisha-Khan Perry" title="Black Women against the Land Grab: The Fight for Racial Justice in Brazil " class="rotating-item" height="225" /></a>
                  
      <a href="./display/elincoln"><img src="./themes/rab/images/books/lincoln.jpg" alt="Brilliant Discourse: Pictures and Readers in Early Modern Rome by Evelyn Lincoln" title="Brilliant Discourse: Pictures and Readers in Early Modern Rome" class="rotating-item" height="225" /></a>

      <a href="./display/fhamlin"><img src="./themes/rab/images/books/hamlin.jpg" alt="Crossroads at Clarksdale: The Black Freedom Struggle in the Mississippi Delta after World War II by Francoise Hamlin" title="Crossroads at Clarksdale: The Black Freedom Struggle in the Mississippi Delta after World War II" class="rotating-item" height="225" /></a>

      <a href="./display/mblyth"><img src="./themes/rab/images/books/blyth.jpg" alt="Austerity by Mark Blyth" title="Austerity" class="rotating-item" height="225" /></a>

      <a href="./display/bevenson"><img src="./themes/rab/images/books/evenson.jpg" alt="Immobility by Brian Evenson" title="Immobility" class="rotating-item" height="225" /></a>

      <a href="./display/rcheit"><img src="./themes/rab/images/books/cheit.jpg" alt="The Witch-Hunt Narrative: Politics, Psychology, and the Sexual Abuse of Children by Ross Cheit" title="The Witch-Hunt Narrative: Politics, Psychology, and the Sexual Abuse of Children" class="rotating-item" height="225" /></a>

      <a href="./display/njacobs"><img src="./themes/rab/images/books/jacobs.jpg" alt="African History through Sources by Nancy Jacobs" title="African History through Sources: Volume 1, Colonial Contexts and Everyday Experiences, c.1850-1946" class="rotating-item" height="225" /></a>


      <a href="./display/rself"><img src="./themes/rab/images/books/self.jpg" alt="All in the Family: The Realignment of American Democracy Since the 1960s by Robert Self" title="All in the Family: The Realignment of American Democracy Since the 1960s" class="rotating-item" height="225" /></a>

      <a href="./display/cmaso"><img src="./themes/rab/images/books/maso.jpg" alt="Mother and Child by Carole Maso" title="Mother and Child: A Novel" class="rotating-item" height="225" /></a>

      <a href="./display/dkertzer"><img src="./themes/rab/images/books/kertzer.jpg" alt="The Pope and Mussolini by David Kertzer" title="The Pope and Mussolini: The Secret History of Pius XI and the Rise of Fascism in Europe" class="rotating-item" height="225" /></a>

      <a href="./display/mggill"><img src="./themes/rab/images/books/gill.jpg" alt="Philosophos: Plato's Missing Dialogue by Mary Louise Gill" title="Philosophos: Plato's Missing Dialogue" class="rotating-item" height="225" /></a>

      <a href="./display/jleinawe"><img src="./themes/rab/images/books/leinaweaver.jpg" alt="Adoptive Migration: Raising Latinos in Spain by Jessaca Leinaweaver" title="Adoptive Migration: Raising Latinos in Spain" class="rotating-item" height="225" /></a>

      <a href="./display/cmontros"><img src="./themes/rab/images/books/montross.jpg" alt="Falling Into the Fire: A Psychiatrist's Encounters with the Mind in Crisis by Christine Montross" title="Falling Into the Fire: A Psychiatrist's Encounters with the Mind in Crisis" class="rotating-item" height="225" /></a>

      <a href="./display/jtomasip"><img src="./themes/rab/images/books/tomasi.jpg" alt="Free Market Fairness by John Tomasi" title="Free Market Fairness" class="rotating-item" height="225" /></a>

      <a href="./display/rherz"><img src="./themes/rab/images/books/herz.jpg" alt="That's Disgusting: Unraveling the Mysteries of Repulsion by Rachel Herz" title="That's Disgusting: Unraveling the Mysteries of Repulsion" class="rotating-item" height="225" /></a>

      <a href="./display/dhogan"><img src="./themes/rab/images/books/hogan.jpg" alt="Family Consequences of Children's Disabilities by Denis Hogan" title="Family Consequences of Children's Disabilities" class="rotating-item" height="225" /></a>


      <a href="./display/el46"><img src="./themes/rab/images/books/lim.jpg" alt="Brown Boys and Rice Queens: Spellbinding Performance in the Asias by Eng-Beng Lim" title="Brown Boys and Rice Queens: Spellbinding Performance in the Asias" class="rotating-item" height="225" /></a>

      <a href="./display/shamdy"><img src="./themes/rab/images/books/hamdy.jpg" alt="Our Bodies Belong to God by Sherine Hamdy" title="Our Bodies Belong to God: Organ Transplants, Islam, and the Struggle for Human Dignity in Egypt" class="rotating-item" height="225" /></a>

      <a href="./display/rlagos"><img src="./themes/rab/images/books/lagos_escobar.jpg" alt="The Southern Tiger: Chile's Fight for a Democratic and Prosperous Future by Ricardo Lagos Escobar" title="The Southern Tiger: Chile's Fight for a Democratic and Prosperous Future" class="rotating-item" height="225" /></a>

      <a href="./display/dcjackso"><img src="./themes/rab/images/books/jackson.jpg" alt="Life in a Shell: A Physiologist's View of a Turtle by Donald C. Jackson" title="Life in a Shell: A Physiologist's View of a Turtle" class="rotating-item" height="225" /></a>

      <a href="./display/aremensn"><img src="./themes/rab/images/books/remensnyder.jpg" alt="La Conquistadora by Amy Remensnyder" title="La Conquistadora: The Virgin Mary at War and Peace in the Old and New Worlds" class="rotating-item" height="225" /></a>

      <a href="./display/lf7"><img src="./themes/rab/images/books/fisher.jpg" alt="The Indian Great Awakening: Religion and the Shaping of Native Cultures in Early America by Linford D. Fisher" title="The Indian Great Awakening: Religion and the Shaping of Native Cultures in Early America" class="rotating-item" height="225" /></a>

      <a href="./display/jcayley"><img src="./themes/rab/images/books/cayley.jpg" alt="How It Is in Common Tongues by John Cayley" title="How It Is in Common Tongues" class="rotating-item" height="225" /></a>

      <a href="./display/jconant"><img src="./themes/rab/images/books/conant.jpg" alt="Staying Roman by Jonathan Conant" title="Staying Roman: Conquest and Identity in Africa and the Mediterranean, 439-700" class="rotating-item" height="225" /></a>

      <a href="./display/tgharris"><img src="./themes/rab/images/books/harris.jpg" alt="Rebellion: Britain's First Stuart Kings, 1567-1642 by Tim Harris" title="Rebellion: Britain's First Stuart Kings, 1567-1642" class="rotating-item" height="225" /></a>

      <a href="./display/pfaudree"><img src="./themes/rab/images/books/faudree.jpg" alt="Singing for the Dead: The Politics of Indigenous Revival in Mexico by Paja Faudree" title="Singing for the Dead: The Politics of Indigenous Revival in Mexico" class="rotating-item" height="225" /></a>

      <a href="./display/jngreen"><img src="./themes/rab/images/books/green.jpg" alt="Modern Latin America by James N. Green" title="Modern Latin America, 8th edition" class="rotating-item" height="225" /></a>

      <a href="./display/narpaly"><img src="./themes/rab/images/books/arpaly.jpg" alt="In Praise of Desire by Nomy Arpaly" title="In Praise of Desire (Oxford Moral Theory)" class="rotating-item" height="225" /></a>

      <a href="./display/km8"><img src="./themes/rab/images/books/miller.jpg" alt="Playing Along by Kiri Miller" title="Playing Along: Digital Games, YouTube, and Virtual Performance (Oxford Music/Media)" class="rotating-item" height="225" /></a>

      <a href="./display/mmandel"><img src="./themes/rab/images/books/mandel.jpg" alt="Muslims and Jews in France by Maud Mandel" title="Muslims and Jews in France: History of a Conflict" class="rotating-item" height="225" /></a>

      <a href="./display/msteinba"><img src="./themes/rab/images/books/steinbach.jpg" alt="The Charmed Life of Flowers by Meredith Steinbach" title="The Charmed Life of Flowers: Field Notes from Provence" class="rotating-item" height="225" /></a>

      <a href="./display/oharmans"><img src="./themes/rab/images/books/harmansah.jpg" alt="Cities and the Shaping of Memory in the Ancient Near East by Omur Harmansah" title="Cities and the Shaping of Memory" class="rotating-item" height="225" /></a>

      <a href="./display/jmsteele"><img src="./themes/rab/images/books/steele.jpg" alt="Ancient Astronomical Observations and the Study of the Moon's Motion (1691-1757) by John Steele" title="Ancient Astronomical Observations and the Study of the Moon's Motion (1691-1757)" class="rotating-item" height="225" /></a>

      <a href="./display/cswensen"><img src="./themes/rab/images/books/swensen.jpg" alt="Gravesend by Cole Swensen" title="Gravesend" class="rotating-item" height="225" /></a>

      <a href="./display/mrutz"><img src="./themes/rab/images/books/rutz.jpg" alt="Bodies of Knowledge in Ancient Mesopotamia by Matthew Rutz" title="Bodies of Knowledge in Ancient Mesopotamia: The Diviners of Late Bronze Age Emar and their Tablet Collection (Ancient Magic and Divination)" class="rotating-item" height="225" /></a>

      <a href="./display/jwideman"><img src="./themes/rab/images/books/wideman.jpg" alt="Conversations with John Edgar Wideman" title="Conversations with John Edgar Wideman" class="rotating-item" height="225" /></a>

      <a href="./display/jpucci"><img src="./themes/rab/images/books/pucci.jpg" alt="Augustine's Virgilian Retreat by Joseph Pucci" title="Augustine's Virgilian Retreat: Reading the Auctores at Cassiciacum" class="rotating-item" height="225" /></a>

      <a href="./display/as49"><img src="./themes/rab/images/books/scherer.jpg" alt="Embattled Bodies, Embattled Places: War in Pre-Columbian Mesoamerica and the Andes by Andrew Scherer"title="Embattled Bodies, Embattled Places: War in Pre-Columbian Mesoamerica and the Andes" class="rotating-item" height="225" /></a>

      <a href="./display/pandreas"><img src="./themes/rab/images/books/andreas.jpg" alt="Smuggler Nation: How Illicit Trade Made America by Peter Andreas" title="Smuggler Nation: How Illicit Trade Made America" class="rotating-item" height="225" /></a>

      <a href="./display/cimbrigl"><img src="./themes/rab/images/books/imbriglio.jpg" alt="Intimacy by Catherine Imbriglio" title="Intimacy" class="rotating-item" height="225" /></a>

      <a href="./display/rmeckel"><img src="./themes/rab/images/books/meckel.jpg" alt="Classrooms and Clinics by Richard A. Meckel" title="Classrooms and Clinics: Urban Schools and the Protection and Promotion of Child Health, 1870-1930 (Critical Issues in Health and Medicine)" class="rotating-item" height="225" /></a>

      <a href="./display/avidler"><img src="./themes/rab/images/books/vidler.jpg" alt="The Third Typology and Other Essays by Anthony Vidler" title="The Third Typology and Other Essays" class="rotating-item" height="225" /></a>
       
      <a href="./display/nbarnett">
      <img src="./themes/rab/images/books/barnett.jpg" alt="College Student Alcohol Abuse by Nancy Barnett by Nancy Barnett" title="College Student Alcohol Abuse" class="rotating-item" height="225"/>
      </a>

      <a href="./display/sgolub">
      <img src="./themes/rab/images/books/sgolub.jpg" alt="Incapacity: Wittgenstein, Anxiety, and Performance Behavior by Spencer Golub" title="Incapacity: Wittgenstein, Anxiety, and Performance Behavior" class="rotating-item" height="225"/>
      </a>

      <a href="./display/jpallen">
      <img src="./themes/rab/images/books/jpallen.jpg" alt="The Ancient Egyptian Language: a Historical Study by James P. Allen" title="The Ancient Egyptian Language: a Historical Study" class="rotating-item" height="225"/>
      </a>

      <a href="./display/pgould">
      <img src="./themes/rab/images/books/gould.jpg" alt="Writing the Rebellion: Loyalists and the Literature of Politics in British America by Philip Gould" title="Writing the Rebellion: Loyalists and the Literature of Politics in British America" class="rotating-item" height="225"/>
      </a>

      <a href="./display/rrambuss">
      <img src="./themes/rab/images/books/rambuss.jpg" alt="The English Poems of Richard Crashaw edited by Richard Rambuss" title="The English Poems of Richard Crashaw" class="rotating-item" height="225"/>
      </a>

      <a href="./display/mblasing">
      <img src="./themes/rab/images/books/blasing.jpg" alt="Nazim Hikmet: The Life and Times of Turkey's World Poet by Mutlu Blasing" title="Nazim Hikmet: The Life and Times of Turkey's World Poet" class="rotating-item" height="225"/>
      </a>

      <a href="./display/sburrows">
      <img src="./themes/rab/images/books/burrows.jpg" alt="A Familiar Strangeness: American Fiction and the Language of Photography, 1839-1945 by Stuart Burrows" title="A Familiar Strangeness: American Fiction and the Language of Photography, 1839-1945" class="rotating-item" height="225"/>
      </a>

      <a href="./display/jegan">
      <img src="./themes/rab/images/books/egan.jpg" alt="Oriental Shadows: The Presence of the East in Early American Literature by Jim Egan" title="Oriental Shadows: The Presence of the East in Early American Literature" class="rotating-item" height="225"/>
      </a>

      <a href="./display/pbarmstr">
      <img src="./themes/rab/images/books/armstrong.jpg" alt="The Neuroscience of Reading and Art by Paul B. Armstrong" title="The Neuroscience of Reading and Art" class="rotating-item" height="225"/>
      </a>

      <a href="./display/jkuzner">
      <img src="./themes/rab/images/books/kuzner.jpg" alt="Open Subjects: Renaissance Republicans, Modern Selfhoods and the Virtue of Vulnerability by James Kuzner" title="Open Subjects: Renaissance Republicans, Modern Selfhoods and the Virtue of Vulnerability" class="rotating-item" height="225"/>
      </a>

      <a href="./display/sstewart">
      <img src="./themes/rab/images/books/stuart-steinberg.jpg" alt="Impious Fidelity: Anna Freud, Psychoanalysis, Politics by Suzanne Stuart-Steinberg" title="Impious Fidelity: Anna Freud, Psychoanalysis, Politics" class="rotating-item" height="225"/>
      </a>


      <a href="./display/khaynes">
      <img src="./themes/rab/images/books/haynes.jpg" alt="Broken Hierarchies: Collected Poems 1952-2012 edited by Kenneth Haynes" title="Broken Hierarchies: Collected Poems 1952-2012" class="rotating-item" height="225"/>
      </a>

      <a href="./display/mcammett">
      <img src="./themes/rab/images/books/cammett.jpg" alt="Compassionate Communalism: Welfare and Sectarianism in Lebanon by Melani C. Cammett" title="Compassionate Communalism: Welfare and Sectarianism in Lebanon" class="rotating-item" height="225"/>
      </a>

      <a href="./display/mc133">
      <img src="./themes/rab/images/books/clayton.jpg" alt="Poetry in Pieces: Cesar Vallejo and Lyric Modernity by Michelle Clayton" title="Poetry in Pieces: Cesar Vallejo and Lyric Modernity" class="rotating-item" height="225"/>
      </a>

      <a href="./display/smerrim">
      <img src="./themes/rab/images/books/merrim.jpg" alt="The Spectacular City, Mexico, and Colonial Hispanic Literary Culture by Stephanie Merrim" title="The Spectacular City, Mexico, and Colonial Hispanic Literary Culture" class="rotating-item" height="225"/>
      </a>

      </div>
                 <p></p>
                 <p class="viewprofile">Click book jacket to view faculty profile</p>
                             
                  <hr style="width:90%;clear:right;" />
                         
       <div style="padding: 15px">

      <table style="background-color:white;width:100%;text-align:center;">
      <tr><td>
                        
      <p style="margin-top:10px"><img src="./themes/rab/images/orcid-logo.png" /><br />
      Get a <a href="https://library.brown.edu/orcid/">Brown ORCID Identifier</a>!</p>
      <p style="font-size:small">Publishers and funding agencies are increasingly requesting ORCIDs for manuscript and grant submissions.</p>
      </p>                 
       
      </td></tr> 
      </table>                
      </div>
      <!-- end of new content -->           
      </section> <!-- #intro -->
        <#include "footer.ftl">
    </body>
</html>
