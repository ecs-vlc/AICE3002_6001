function insert(url) {
	const here = document.currentScript;
	const content = document.createElement("div");
	here.parentNode.insertBefore(content, here);

	fetch(url).then(function (response) {
		if (response.ok) {
			return response.text();
		}
		throw response;
	}).then(function (text) {
		content.innerHTML = text;
	});
}