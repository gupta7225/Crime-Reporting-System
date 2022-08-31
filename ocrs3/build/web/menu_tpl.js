/* --- geometry and timing of the menu --- */
var MENU_POS = [];

	// item sizes for different levels of menu
	MENU_POS['height']     = [22, 22, 22, 22];
	MENU_POS['width']      = [100, 100, 100, 100];

	// menu block offset from the origin:
	//  for root level origin is upper left corner of the page
	//  for other levels origin is upper left corner of parent item
	MENU_POS['block_top']  = [0, 23, 0, 0];
	MENU_POS['block_left'] = [150, 0, 100, 151];

	// offsets between items of the same level
	MENU_POS['top']        = [0, 23, 23, 23];
	MENU_POS['left']       = [320, 0, 0, 0];

	// time in milliseconds before menu is hidden after cursor has gone out
	// of any items
	MENU_POS['hide_delay'] = [100, 100, 100, 100];

/* --- dynamic menu styles ---
note: you can add as many style properties as you wish but be not all browsers
are able to render them correctly. The only relatively safe properties are
'color' and 'background'.
*/

var MENU_STYLES = [];

	// default item state when it is visible but doesn't have mouse over
	MENU_STYLES['onmouseout'] = [
		'color', ['white', 'white', 'white', ''],
		'background', ['#1A4D81', '#1A4D81', '#1A4D81', ''],
                'border',['2px solid transparent', '2px solid black', '2px solid black', ''],
                'textAlign',['center', 'center', 'center', ''],
                'borderRadius',['10px', '10px', '10px', ''],
                'backgroundImage',['url("lev0_bg2.gif")', 'url("lev0_bg2.gif")', 'url("lev0_bg2.gif")', ''],
                'textDecoration',['none', 'none', 'none', ''],
                'fontFamily',['sans-serif', 'sans-serif', 'sans-serif', ''],
                'boxShadow',['10px 20px 30px #1A4D81', '', '', ''],
	];

	// state when item has mouse over it
	MENU_STYLES['onmouseover'] = [
                
                'color', ['white', 'white', 'white', ''],
		'background', ['#1A4D81', '#1A4D81', '#1A4D81', ''],
                'border',['2px solid transparent', '', '', ''],
                'textAlign',['center', 'center', 'center', ''],
                'borderRadius',['10px', '10px', '10p', ''],
                'backgroundImage',['', 'url("lev1_arrow.gif")', 'url("lev1_arrow.gif")', ''],
                'backgroundRepeat',['', 'no-repeat', 'no-repeat', ''],
                'fontFamily',['sans-serif', 'sans-serif', 'sans-serif', ''],
		
	];

	// state when mouse button has been pressed on the item
	MENU_STYLES['onmousedown'] = [
		
		 'color', ['white', 'white', 'white', ''],
		'background', ['#1A4D81', '#1A4D81', '#1A4D81', ''],
                'border',['2px solid transparent', '', '', ''],
                'textAlign',['center', 'center', 'center', ''],
                'borderRadius',['10px', '10px', '10px', ''],
                'backgroundImage',['url("lev1_arrow.gif")', 'url("lev1_arrow.gif")', 'url("lev1_arrow.gif")', ''],
                'backgroundRepeat',['no-repeat', 'no-repeat', 'no-repeat', ''],
		];
	
