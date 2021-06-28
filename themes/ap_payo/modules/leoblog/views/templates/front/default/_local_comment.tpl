{*
 *  Leo Prestashop SliderShow for Prestashop 1.6.x
 *
 * @package   leosliderlayer
 * @version   3.0
 * @author    http://www.leotheme.com
 * @copyright Copyright (C) October 2013 LeoThemes.com <@emai:leotheme@gmail.com>
 *               <info@leotheme.com>.All rights reserved.
 * @license   GNU General Public License version 2
*}

<div id="blog-localengine">
		{if $config->get('item_show_listcomment','1') == 1}
			<h3>{l s='Comments' d='Shop.Theme.Global'}</h3>
			
			<div class="comments clearfix">
				{foreach from=$comments item=comment name=comment} {$default=''}
				<div class="comment-item" id="comment{$comment.id_comment|escape:'html':'UTF-8'}">
					<img src="http://www.gravatar.com/avatar/{md5(strtolower(trim($comment.email|escape:'html':'UTF-8')))}?d={urlencode($default|escape:'html':'UTF-8')}&s=60" align="left"/>
					<div class="comment-wrap">
						<div class="comment-meta">
							<span class="comment-infor">
								<span class="comment-created">{l s='Created On' d='Shop.Theme.Global'}<span> {strtotime($comment.date_add)|date_format:"%A, %B %e, %Y"|escape:'html':'UTF-8'}</span></span>
								<span class="comment-postedby">{l s='Posted by' d='Shop.Theme.Global'}<span> {$comment.user|escape:'html':'UTF-8'}</span></span>
							</span>
							
							<span class="comment-link"><a href="{$blog_link|escape:'html':'UTF-8'}#comment{$comment.id_comment|intval}">{l s='Comment Link' d='Shop.Theme.Global'}</a></span>
						</div>

						<div class="comment-content">
							{$comment.comment|nl2br nofilter}{* HTML form , no escape necessary *}
						</div>
					</div>
				</div>
				{/foreach}
				{if $blog_count_comment}
				<div class="top-pagination-content clearfix bottom-line">
					{include file="module:leoblog/views/templates/front/default/_pagination.tpl"}
				</div>
				{/if}
			</div>
		{/if}
		
		{if $config->get('item_show_formcomment','1') == 1}
			<h3>{l s='Leave your comment' d='Shop.Theme.Global'}</h3>
			<form class="form-horizontal clearfix" method="post" id="comment-form" action="{$blog_link|escape:'html':'UTF-8'}" onsubmit="return false;">
				<div class="form-group row">
					<div  class="col-lg-3">
						<label class="control-label" for="inputFullName">{l s='Full Name' d='Shop.Theme.Global'}</label>
					</div>
					<div class="col-lg-9">
						<input type="text" name="user" placeholder="{l s='Enter your full name' d='Shop.Theme.Global'}" id="inputFullName" class="form-control">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-lg-3">
						<label class="control-label" for="inputEmail">{l s='Email' d='Shop.Theme.Global'}</label>
					</div>
					<div class="col-lg-9">
						<input type="text" name="email"  placeholder="{l  s='Enter your email' d='Shop.Theme.Global'}" id="inputEmail" class="form-control">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-lg-3">
						<label class="control-label" for="inputComment">{l  s='Comment' d='Shop.Theme.Global'}</label>
					</div>
					<div class="col-lg-9">
						<textarea type="text" name="comment" rows="6"  placeholder="{l  s='Enter your comment' d='Shop.Theme.Global'}" id="inputComment" class="form-control"></textarea>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-lg-3">
						<label class="control-label" for="inputEmail">{l s='Captcha' d='Shop.Theme.Global'}</label>
					</div>
					<div class="col-lg-8 col-md-8 ipts-captcha">
						 <img src="{$captcha_image|escape:'html':'UTF-8'}" class="comment-capcha-image" align="left"/>
						<input class="form-control" type="text" name="captcha" value="" size="10"  />
					</div>
				</div>

				<input type="hidden" name="id_leoblog_blog" value="{$id_leoblog_blog|intval}">
				<div class="form-group row">
					<div class="col-lg-9 col-lg-offset-3"><button class="btn btn-secondary btn-submit-comment" name="submitcomment" type="submit">{l s='Submit' d='Shop.Theme.Global'}</button></div>
					<div class="leoblog-cssload-container">
						<div class="cssload-speeding-wheel"></div>
					</div>
				</div>
			</form>
		{/if}
</div>