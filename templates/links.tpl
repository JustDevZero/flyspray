<div id="menu">

<?php if ($user->isAnon()):
          $this->display('loginbox.tpl');
      else: ?>
<ul id="menu-list">
  <li class="first" onmouseover="perms.do_later('show')" onmouseout="perms.hide()">
	<a id="profilelink" href="{CreateURL('myprofile')}" title="{L('editmydetails')}">
	  <em>{$user->infos['real_name']} ({$user->infos['user_name']})</em>
	</a>
	<div id="permissions">
	  {!tpl_draw_perms($user->perms)}
	</div>
  </li>
  <li>
  <a id="lastsearchlink" href="" accesskey="m" onclick="showhidestuff('mysearches');return false;" class="inactive">{L('mysearch')}</a>
  <div id="mysearches">
    <?php $this->display('links.searches.tpl'); ?>
  </div>
  </li>
<?php if ($user->perms('is_admin')): ?>
  <li>
  <a id="optionslink" href="{CreateURL('admin', 'prefs')}">{L('admintoolbox')}</a>
  </li>
<?php endif; ?>

  <li>
  <a id="logoutlink" href="{CreateURL('logout', null)}"
    accesskey="l">{L('logout')}</a>
  </li>

</ul>
<?php endif; ?>
</div>

<div id="pm-menu">

<div id="projectselector">
    <form id="projectselectorform" action="{$_SERVER['SCRIPT_NAME']}" method="get">
       <div>
        <select name="project">
          {!tpl_options(array_merge(array(0 => L('allprojects')), $fs->projects), $proj->id)}
        </select>
        <button type="submit" value="1" name="switch">{L('switch')}</button>
        <input type="hidden" name="do" value="{$do}" />
        <?php $check = array('area', 'id');
              if ($do == 'reports') {
                $check = array_merge($check, array('open', 'close', 'edit', 'assign', 'repdate', 'comments', 'attachments',
                                'related', 'notifications', 'reminders', 'within', 'duein', 'fromdate', 'todate'));
              }
              foreach ($check as $key):
              if (Get::has($key)): ?>
        <input type="hidden" name="{$key}" value="{Get::val($key)}" />
        <?php endif;
              endforeach; ?>
      </div>
    </form>
</div>

<ul id="pm-menu-list">
    <li class="first">
      <a id="toplevellink" href="{CreateURL('toplevel', $proj->id)}">{L('overview')}</a>
    </li>

    <li>
    <a id="homelink"
        href="{CreateURL('project', $proj->id, null, array('do' => 'index'))}">{L('tasklist')}</a>
    </li>

    <?php if ($proj->id && $user->perms('open_new_tasks')): ?>
      <li>
      <a id="newtasklink" href="{CreateURL('newtask', $proj->id)}"
        accesskey="a">{L('addnewtask')}</a>
      </li>
    <?php elseif ($proj->id && $user->isAnon() && $proj->prefs['anon_open']): ?>
      <li>
        <a id="anonopen" href="?do=newtask&amp;project={$proj->id}">{L('opentaskanon')}</a>
      </li>
    <?php endif; ?>

    <?php if ($user->perms('view_reports')): ?>
      <li>
      <a id="reportslink" href="{CreateURL('reports', null, null, array('project' => $proj->id))}">{L('reports')}</a>
      </li>
    <?php endif; ?>

    <?php if ($proj->id): ?>
    <li>
    <a id="roadmaplink"
        href="{CreateURL('roadmap', $proj->id)}">{L('roadmap')}</a>
    </li>
    <?php endif; ?>

    <?php if ($proj->id && $user->perms('manage_project')): ?>
      <li>
      <a id="projectslink"
        href="{CreateURL('pm', 'prefs', $proj->id)}">{L('manageproject')}</a>
      </li>
    <?php endif; ?>

    <?php if ($proj->id && isset($pm_pendingreq_num) && $pm_pendingreq_num): ?>
      <li>
        <a class="pendingreq attention"
           href="{CreateURL('pm', 'pendingreq', $proj->id)}">{$pm_pendingreq_num} {L('pendingreq')}</a>
      </li>
    <?php endif; ?>
</ul>
</div>
