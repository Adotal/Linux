/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";

/* Colors converted from dwl RGBA hex to standard X11 Hex */
static const char col_black[]       = "#000000";
static const char col_gray[]        = "#444444";
static const char col_red[]         = "#ff0000";
static const char col_white[]       = "#ffffff";

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_white, col_black, col_black },
	[SchemeSel]  = { col_white, col_gray,  col_gray  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "firefox",  NULL,       NULL,       1 << 2,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55f; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask /* Super/Windows key */

/* In X11, Shift alters the keysym directly, so we don't need a separate SKEY variable */
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} }

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_black, "-nf", col_white, "-sb", col_gray, "-sf", col_white, NULL };
static const char *termcmd[]  = { "alacritty", NULL }; /* Note: foot is wayland-native. You might want "st" or "alacritty" */

// brightness 
static const char *brightnessup[] = { "brightnessctl", "set", "+5%", NULL };
static const char *brightnessdw[] = { "brightnessctl", "set", "5%-", NULL };

// Screenshots (Converted to X11 maim/xclip syntax)
static const char *fullscrot[] = {
	"sh", "-c",
	"maim | tee \"$HOME/Images/Screenshots/$(date +'%d_%m_%Y_%s').png\" | xclip -selection clipboard -t image/png",
	NULL
};
static const char *selscrot[] = {
	"sh", "-c",
	"maim -s | tee \"$HOME/Images/Screenshots/$(date +'%d_%m_%Y_%s')_sel.png\" | xclip -selection clipboard -t image/png",
	NULL
};

// Shutdown - Reboot (renamed slightly to avoid C stdlib function shadowing)
static const char *shutdowncmd[] = { "shutdown", "now", NULL };
static const char *rebootcmd[] = { "reboot", NULL };

// Volume control with pipewire
static const char *volup[] = {"pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%", NULL};
static const char *voldw[] = {"pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%", NULL};
static const char *volmute[] = {"pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle", NULL};
// Mic mute
static const char *micmute[] = {"pactl", "set-source-mute", "@DEFAULT_SOURCE@", "toggle", NULL};
// Win + E (file manager)
static const char *pcmanfm[] = {"pcmanfm", NULL};
// Win + B (default browser)
static const char *defaultBrowser[] = {"firefox", NULL};

static const Key keys[] = {
	/* modifier                     key                       function        argument */
	// Personal
	{ 0,                            XF86XK_MonBrightnessUp,   spawn,          {.v = brightnessup} },
	{ 0,                            XF86XK_MonBrightnessDown, spawn,          {.v = brightnessdw} },
	{ 0,                            XK_Print,                 spawn,          {.v = fullscrot} },
	{ MODKEY|ShiftMask,             XK_s,                     spawn,          {.v = selscrot} },
	{ Mod1Mask,                     XK_F4,                    killclient,     {0} },
	{ MODKEY|Mod1Mask,              XK_r,                     spawn,          {.v = rebootcmd} },
	{ MODKEY|Mod1Mask,              XK_q,                     spawn,          {.v = shutdowncmd} },
	{ 0,                            XF86XK_AudioRaiseVolume,  spawn,          {.v = volup} },
	{ 0,                            XF86XK_AudioLowerVolume,  spawn,          {.v = voldw} },
	{ 0,                            XF86XK_AudioMute,         spawn,          {.v = volmute} },
	{ 0,                            XF86XK_AudioMicMute,      spawn,          {.v = micmute} },
	{ MODKEY,                       XK_e,                     spawn,          {.v = pcmanfm} },
	{ MODKEY,                       XK_a,                     zoom,           {0} },
	{ MODKEY,                       XK_b,                     spawn,          {.v = defaultBrowser} },

	// Default
	{ MODKEY,                       XK_p,                     spawn,          {.v = dmenucmd} },
	{ MODKEY,                       XK_Return,                spawn,          {.v = termcmd} },
	{ MODKEY,                       XK_j,                     focusstack,     {.i = +1} },
	{ MODKEY,                       XK_k,                     focusstack,     {.i = -1} },
	{ MODKEY,                       XK_i,                     incnmaster,     {.i = +1} },
	{ MODKEY,                       XK_d,                     incnmaster,     {.i = -1} },
	{ MODKEY,                       XK_h,                     setmfact,       {.f = -0.05f} },
	{ MODKEY,                       XK_l,                     setmfact,       {.f = +0.05f} },
	{ MODKEY,                       XK_Tab,                   view,           {0} },
	{ MODKEY,                       XK_q,                     killclient,     {0} },
	{ MODKEY,                       XK_t,                     setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_n,                     setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,                     setlayout,      {.v = &layouts[2]} },
	{ MODKEY|Mod1Mask,              XK_f,                     setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_f,                     togglefloating, {0} },
	{ MODKEY,                       XK_0,                     view,           {.ui = ~0} },
	{ MODKEY|ShiftMask,             XK_0,                     tag,            {.ui = ~0} },
	{ MODKEY,                       XK_comma,                 focusmon,       {.i = -1} },
	{ MODKEY,                       XK_period,                focusmon,       {.i = +1} },
	{ MODKEY|ShiftMask,             XK_comma,                 tagmon,         {.i = -1} },
	{ MODKEY|ShiftMask,             XK_greater,               tagmon,         {.i = +1} },
	TAGKEYS(                        XK_1,                     0),
	TAGKEYS(                        XK_2,                     1),
	TAGKEYS(                        XK_3,                     2),
	TAGKEYS(                        XK_4,                     3),
	TAGKEYS(                        XK_5,                     4),
	TAGKEYS(                        XK_6,                     5),
	TAGKEYS(                        XK_7,                     6),
	TAGKEYS(                        XK_8,                     7),
	TAGKEYS(                        XK_9,                     8),
	{ MODKEY|ShiftMask,             XK_q,                     quit,           {0} },
};

/* button definitions */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
};
