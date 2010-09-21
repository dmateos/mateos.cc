<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Written by Daniel Mateos (daniel@mateos.cc), Current as of Septemberish 2010 -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>Daniel Mateos</title>
		<meta name="author" content="Daniel Mateos"/>
		<meta name="keywords" content="daniel mateos, dmateos, dman, developer, adelaide, australia, sysadmin"/>
		<meta name="description" content="Homepage of Daniel Mateos, Sysadmin/Developer in Adelaide Australia"/>
		<link rel="openid.server" href="http://www.myopenid.com/server"/> 
   		<link rel="openid.delegate" href="http://dmateos.myopenid.com/"/>
		<link rel="stylesheet" type="text/css" href="styles/index.css"/> 
		<script type="text/javascript" src="scripts/jquery.js"></script> 
		<script type="text/javascript">
			// Google analytics
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-3547977-1']);
			_gaq.push(['_trackPageview']);
			(function() {
				var ga = document.createElement('script'); 
				ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0]; 
				s.parentNode.insertBefore(ga, s);
			})();
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				// Scrolling effect on content. 
				var hidden = new Boolean(true);
				var speed = "slow";

				// Hide content box's, bind some events to unhide on click
				// and one to unide them all on main header click.
				$(".contentbox").hide();
				$("h1#abouthead").click(function() {
					$("div#aboutdata").slideToggle(speed);
				});
				$("h1#projectshead").click(function() {
					$("div#projectsdata").slideToggle(speed);
				});
				$("h1#contacthead").click(function() {
					$("div#contactdata").slideToggle(speed);
				});
				$("div#headingimg").click(function() {
					if(hidden) {
						$(".contentbox").slideDown(speed);
						hidden=false;
					}
					else {
						$(".contentbox").slideUp(speed);
						hidden=true;
					}
				});
			});
		</script>
	</head>
	<body>
		<div id="headingimg" class="headingbox">
			<img alt="Daniel Mateos" src="resources/heading.png"/>
		</div>
		<h1 id="abouthead">About</h1>
		<div id="aboutdata" class="contentbox">
			I'm a System Administrator/Software Developer from Adelaide, South Australia,
			i currently have <? include 'scripts/twitfollowers.php'; print twitfollowers("dmateos"); ?> followers on 
			<a href="http://twitter.com/dmateos">twitter</a>, and i'm also on <a href="http://facebook.com/dmateos">facebook</a> 
			and <a href="http://github.com/dmateos">github</a>.
			<p>
			I work at a local IT consulting firm, we do lots of interesting stuff ranging from server infrastructure/virtualization setup and maintenence
			to writting complex web applications. 
			</p>
		</div>
		<h1 id="projectshead">Projects</h1>
		<div id="projectsdata" class="contentbox">
			Mostly little programs i've written over the years to get familiar with a particular library or concept, here are the ones i like the most.
			<p>
			<a href="http://github.com/dmateos/conway.js">Conway.js</a> 
			Port of Coneway to javascript using html5 canvas and CSS.
			<a href="http://mateos.cc/scripts/conway/demo.html">[demo]</a><br/>
			<a href="http://github.com/dmateos/scratch/tree/master/coneway/">Coneway</a> Conway game of life simulator using very very basic OpenGL. <br/>
			<a href="http://github.com/dmateos/scratch/tree/master/mr_roboto/">Mr Roboto</a> Modular IRC bot to play around with text parsing and dlfcn. <br/>
			<a href="http://github.com/dmateos/silicon-genesis">Silicon Genesis</a> Virtual life simulator, it makes fungus looking patterns with SDL.<br/>
			<a href="http://github.com/dmateos/scratch/tree/master/paperworld/">Paperworld</a> 2d sidescroller game i made to get familiar with Python. <br/>
			<a href="http://github.com/dmateos/scratch/">Everything else</a> Root of my scratch project dir. <br/>
			</p>
		</div>
		<h1 id="contacthead">Contact</h1>
		<div id="contactdata" class="contentbox">
			Email: <a href="mailto:daniel@mateos.cc">daniel@mateos.cc</a>, <a href="mailto:daniel@jgiconsulting.com">daniel@jgiconsulting.com</a><br/>
			Twitter: <a href="http://twitter.com/dmateos">@dmateos</a> <br/>
			IRC: dman on <a href="irc://irc.freenode.net">irc.freenode.net</a> <br/>
			Resume: <a href="/resume.html">html</a>, <a href="/resume.pdf">pdf</a><br/>
		</div>
	</body>
</html> 
