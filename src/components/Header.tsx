import Link from 'next/link';
import React from 'react';

const linkStyle = {
	marginRight: 15
}

export default class Header extends React.Component {
	render() {
		return (
			<div>
				<Link href="/">
					<a style={linkStyle}>Home</a>
				</Link>
				<Link href="/about">
					<a style={linkStyle}>About</a>
				</Link>
			</div>
		)
	}
}