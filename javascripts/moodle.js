function insert(url, selector) {
	const here = document.currentScript;
	const content = document.createElement("div");
	here.parentNode.insertBefore(content, here);

	fetch(url).then(function (response) {
		if (response.ok) {
			return response.text();
		}
		throw response;
	}).then(html => {
	    const parser = new DOMParser();
		const doc = parser.parseFromString(html, "text/html");

		if (selector) {
			content.innerHTML = doc.querySelector(selector).innerHTML;
		} else {
			content.innerHTML = doc.innerHTML;
		}
	  })
	  .catch(error => {
	     content.innerHTML = 'Failed to fetch page: ' + error;
	     console.error('Failed to fetch page: ', error);
	  })
}
