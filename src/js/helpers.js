/**
 * @title Is On Page
 * @description Check if a given node exists in the current DOM
 * @param {Node|Element} node - The HTML Node or Element
 */
export function isOnPage(node) {
	/* If a list of nodes are detected, use the first one */
	if (node instanceof NodeList) node = node[0];

	return node === document.body ? false : document.body.contains(node);
}

/**
 * @title Get Siblings
 * @descript Get the siblings of an element
 */
export function getSiblings(element) {
	// for collecting siblings
	let siblings = [];
	// if no parent, return no sibling
	if (!element.parentNode) {
		return siblings;
	}
	// first child of the parent node
	let sibling = element.parentNode.firstChild;

	// collecting siblings
	while (sibling) {
		if (sibling.nodeType === 1 && sibling !== element) {
			siblings.push(sibling);
		}
		sibling = sibling.nextSibling;
	}
	return siblings;
}
