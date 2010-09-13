<? 
/**
 * Fetch the number of followers from twitter api
 * Modified slightly by dmateos for daniel.mateos.cc
 * 
 * @author Peter Ivanov 
 * @copyright    http://www.ooyes.net
 * @version    0.2
 * @link http://www.ooyes.net
 * @param string $username
 * @return string
 */
function twitfollowers($username) {
	$cache_file = '/tmp/php_twitfollowers_cache_' . md5 ( $username );
	 
	if (is_file ( $cache_file ) == false) {
		$cache_file_time = strtotime ( '1984-01-11 07:15' );
	} 
	else {
		$cache_file_time = filemtime ( $cache_file );
	}
	 
	$now = strtotime ( date ( 'Y-m-d H:i:s' ) );
	$api_call = $cache_file_time;
	$difference = $now - $api_call;
	$api_time_seconds = 3600*4; // x hours should be reasonable
	 
	if ($difference >= $api_time_seconds) {
		$api_page = 'http://twitter.com/users/show/' . $username;
		$xml = file_get_contents ( $api_page );
	 
		$profile = new SimpleXMLElement ( $xml );
		$count = $profile->followers_count;
	
		if (is_file ( $cache_file ) == true) {
			unlink ( $cache_file );
		}
		touch ( $cache_file );
		file_put_contents ( $cache_file, strval ( $count ) );
		return strval ( $count );
	} 
	else {
		$count = file_get_contents ( $cache_file );
		return strval ( $count );
	}
}
?>
