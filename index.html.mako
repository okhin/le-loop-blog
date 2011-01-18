<%inherit file="_templates/site.mako" />

% for post in bf.config.blog.posts[0:5]:
<div class="post rounded">
  <a name="${post.slug}"></a>
  <div class="post_title"><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a></div>
  <div class="post_extras">${post.date.strftime("%B %d, %Y at %H:%M")} | categories: 
<% 
   category_links = []
   for category in post.categories:
       if post.draft:
           #For drafts, we don't write to the category dirs, so just write the categories as text
           category_links.append(category.name)
       else:
           category_links.append("<a href='%s'>%s</a>" % (category.path, category.name))
%>
${", ".join(category_links)}
% if bf.config.blog.disqus.enabled:
 | <a href="${post.permalink}#disqus_thread">View Comments</a>
% endif
</div>
  <div class="post_excerpt">
    ${post.summary} <i><a href="${post.permapath()}">Click here for more...</a></i>
  </div>
</div>
% endfor
