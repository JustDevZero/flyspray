<?php

define('IN_FS', true);

header('Content-type: text/html; charset=utf-8');

require_once('../../header.php');
global $proj, $fs;

$baseurl = dirname(dirname($baseurl)) .'/' ;

if (Cookie::has('flyspray_userid') && Cookie::has('flyspray_passhash')) {
    $user = new User(Cookie::val('flyspray_userid'));
    $user->check_account_ok();
    $user->save_search();
} else {
    $user = new User(0, $proj);
}

// don't allow anonymous users to access this page at all
if ($user->isAnon()) {
    die();
}

$task = Flyspray::GetTaskDetails(Post::val('task_id'));
if (!$user->can_edit_task($task)){
    Flyspray::show_error(L('nopermission'));
    die();
}
if(Post::val('name') == "due_date"){
    $value = Flyspray::strtotime(Post::val('value'));
    $value = intval($value);
}
elseif(Post::val('name') == "estimated_effort"){
    $value = effort::EditStringToSeconds(Post::val('value'), $proj->prefs['hours_per_manday'], $proj->prefs['estimated_effort_format']);
    $value = intval($value);
}
else {
    $value = Post::val('value');
}

$oldvalue = $task[Post::val('name')];

$sql = $db->Query("UPDATE {tasks} SET " . Post::val('name') . " = ?,last_edited_time = ? WHERE task_id = ?", array($value, time(), Post::val('task_id')));

// Log the changed field in the task history
Flyspray::logEvent($task['task_id'], 3, Post::val('value'), $oldvalue, Post::val('name'), $time);

?>
