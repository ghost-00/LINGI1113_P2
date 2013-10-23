/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     LABEL = 258,
     IDENTIFIER = 259,
     CBLOCK = 260,
     DEBUG_LINE = 261,
     ENDC = 262,
     ERRORLEVEL = 263,
     FILL = 264,
     LIST = 265,
     NUMBER = 266,
     PROCESSOR = 267,
     STRING = 268,
     DEFINE = 269,
     UPPER = 270,
     HIGH = 271,
     LOW = 272,
     LSH = 273,
     RSH = 274,
     GREATER_EQUAL = 275,
     LESS_EQUAL = 276,
     EQUAL = 277,
     NOT_EQUAL = 278,
     LOGICAL_AND = 279,
     LOGICAL_OR = 280,
     ASSIGN_PLUS = 281,
     ASSIGN_MINUS = 282,
     ASSIGN_MULTIPLY = 283,
     ASSIGN_DIVIDE = 284,
     ASSIGN_MODULUS = 285,
     ASSIGN_LSH = 286,
     ASSIGN_RSH = 287,
     ASSIGN_AND = 288,
     ASSIGN_OR = 289,
     ASSIGN_XOR = 290,
     INCREMENT = 291,
     DECREMENT = 292,
     TBL_NO_CHANGE = 293,
     TBL_POST_INC = 294,
     TBL_POST_DEC = 295,
     TBL_PRE_INC = 296,
     CONCAT = 297,
     VAR = 298,
     VARLAB_BEGIN = 299,
     VAR_BEGIN = 300,
     VAR_END = 301
   };
#endif
/* Tokens.  */
#define LABEL 258
#define IDENTIFIER 259
#define CBLOCK 260
#define DEBUG_LINE 261
#define ENDC 262
#define ERRORLEVEL 263
#define FILL 264
#define LIST 265
#define NUMBER 266
#define PROCESSOR 267
#define STRING 268
#define DEFINE 269
#define UPPER 270
#define HIGH 271
#define LOW 272
#define LSH 273
#define RSH 274
#define GREATER_EQUAL 275
#define LESS_EQUAL 276
#define EQUAL 277
#define NOT_EQUAL 278
#define LOGICAL_AND 279
#define LOGICAL_OR 280
#define ASSIGN_PLUS 281
#define ASSIGN_MINUS 282
#define ASSIGN_MULTIPLY 283
#define ASSIGN_DIVIDE 284
#define ASSIGN_MODULUS 285
#define ASSIGN_LSH 286
#define ASSIGN_RSH 287
#define ASSIGN_AND 288
#define ASSIGN_OR 289
#define ASSIGN_XOR 290
#define INCREMENT 291
#define DECREMENT 292
#define TBL_NO_CHANGE 293
#define TBL_POST_INC 294
#define TBL_POST_DEC 295
#define TBL_PRE_INC 296
#define CONCAT 297
#define VAR 298
#define VARLAB_BEGIN 299
#define VAR_BEGIN 300
#define VAR_END 301




/* Copy the first part of user declarations.  */
#line 1 "parse.y"

/* Parser for gpasm
   Copyright (C) 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005
   James Bowman, Craig Franklin

This file is part of gputils.

gputils is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

gputils is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with gputils; see the file COPYING.  If not, write to
the Free Software Foundation, 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

#include "stdhdr.h"

#include "libgputils.h"
#include "gpasm.h"
#include "evaluate.h"
#include "gperror.h"
#include "directive.h"
#include "lst.h"
#include "macro.h"
#include "coff.h"
#include "scan.h"

void yyerror(char *message)
{
  gperror(103, message);
}

int yylex(void);
extern int _16bit_core;
extern gp_boolean _16packed_byte_acc;
static gp_boolean _16packed_offset_labels;

/************************************************************************/

/* Some simple functions for building parse trees */

static struct pnode *mk_pnode(enum pnode_tag tag)
{
  struct pnode *new = malloc(sizeof(*new));
  new->tag = tag;
  return new;
}

struct pnode *mk_constant(int value)
{
  struct pnode *new = mk_pnode(constant);
  new->value.constant = value;
  return new;
}

struct pnode *mk_offset(struct pnode *p)
{
  struct pnode *new = mk_pnode(offset);
  new->value.offset = p;
  return new;
}

static struct pnode *mk_symbol(char *value)
{
  struct pnode *new = mk_pnode(symbol);
  new->value.symbol = value;
  return new;
}

static struct pnode *mk_string(char *value)
{
  struct pnode *new = mk_pnode(string);
  new->value.string = value;
  return new;
}

struct pnode *mk_list(struct pnode *head, struct pnode *tail)
{
  struct pnode *new = mk_pnode(list);
  new->value.list.head = head;
  new->value.list.tail = tail;
  return new;
}

static struct pnode *mk_2op(int op, struct pnode *p0, struct pnode *p1)
{
  struct pnode *new = mk_pnode(binop);
  new->value.binop.op = op;
  new->value.binop.p0 = p0;
  new->value.binop.p1 = p1;
  return new;
}

static struct pnode *mk_1op(int op, struct pnode *p0)
{
  struct pnode *new = mk_pnode(unop);  new->value.unop.op = op;
  new->value.unop.p0 = p0;
  return new;
}

/************************************************************************/
/* shared functions */

gpasmVal set_label(char *label, struct pnode *parms)
{
  gpasmVal value = 0;

  if (asm_enabled()) {
    value = do_or_append_insn("set", parms);
    if (!state.mac_prev) {
      set_global(label, value, TEMPORARY, gvt_constant);
    }
  }

  return value;
}

int return_op(int operation);

void next_line(int value)
{
  char l[BUFSIZ];
  char *e = l;

  if ((state.src->type == src_macro) || 
      (state.src->type == src_while)) {
    /* while loops can be defined inside a macro or nested */
    if (state.mac_prev) {
      state.lst.line.linetype = none;
      if (state.mac_body)
	state.mac_body->src_line = strdup(state.src->lst.m->src_line);
    }

    if (((state.src->type == src_while) || (state.lst.expand)) &&
        (state.pass == 2)) {
      assert(state.src->lst.m->src_line != NULL);
      lst_format_line(state.src->lst.m->src_line, value);
    }
    
    if (state.src->lst.m->next) {
      state.src->lst.m = state.src->lst.m->next;
    }
  } else if ((state.src->type == src_file) &&
             (state.src->lst.f != NULL)) {
    fgets(l, BUFSIZ, state.src->lst.f);
    l[strlen(l) - 1] = '\0';	/* Eat the trailing newline */

    if (state.mac_prev) {
      state.lst.line.linetype = none;
      if (state.mac_body)
	state.mac_body->src_line = strdup(l);
    }

    if (state.pass == 2) {
      lst_format_line(e, value);
    }
  }

  state.src->line_number++;

  switch (state.next_state) {
    case state_exitmacro:
      execute_exitm();
      break;

    case state_include:
      open_src(state.next_buffer.file, 1);
      free(state.next_buffer.file);
      break;

    case state_macro:
      /* push the label for local directive */
      state.stTop = push_macro_symbol_table(state.stTop);
      execute_macro(state.next_buffer.macro, 0);
      break;

    case state_section:
      /* create a new coff section */
      coff_new_section(state.obj.new_sec_name, 
                       state.obj.new_sec_addr, 
                       state.obj.new_sec_flags);
      break;

    case state_while:
      execute_macro(state.next_buffer.macro, 1);
      break;

    default:
      break;
  }
 
}


/************************************************************************/



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 208 "parse.y"
{
  gpasmVal i;
  char *s;
  struct pnode *p;
}
/* Line 187 of yacc.c.  */
#line 399 "parse.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 412 "parse.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  2
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   421

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  68
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  41
/* YYNRULES -- Number of rules.  */
#define YYNRULES  123
/* YYNRULES -- Number of states.  */
#define YYNSTATES  186

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   301

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      62,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    60,     2,     2,    66,    59,    26,     2,
      67,    63,    57,    55,    64,    56,     2,    58,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    65,     2,
      24,    31,    25,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    53,     2,    54,    28,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    27,     2,    61,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    29,
      30,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     4,     5,     9,    13,    18,    23,    27,
      31,    34,    36,    38,    40,    42,    43,    48,    51,    52,
      57,    58,    63,    68,    72,    75,    78,    82,    89,    97,
      98,   106,   107,   114,   119,   120,   123,   125,   128,   131,
     135,   137,   141,   143,   147,   149,   151,   153,   155,   157,
     159,   161,   163,   165,   167,   169,   172,   176,   179,   181,
     183,   187,   189,   191,   195,   197,   199,   203,   205,   207,
     211,   213,   215,   217,   219,   223,   225,   227,   229,   231,
     233,   235,   237,   241,   243,   245,   247,   251,   253,   255,
     257,   261,   263,   265,   267,   269,   272,   274,   276,   278,
     280,   282,   284,   286,   288,   290,   292,   294,   298,   302,
     304,   306,   308,   310,   312,   316,   320,   322,   326,   330,
     332,   336,   337,   342
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      69,     0,    -1,    -1,    -1,    69,    70,    71,    -1,    69,
       1,    62,    -1,   105,    83,    85,    62,    -1,   105,    31,
      85,    62,    -1,   105,    43,    62,    -1,   105,    42,    62,
      -1,   105,    73,    -1,    73,    -1,     8,    -1,     6,    -1,
      62,    -1,    -1,    12,    74,     4,    62,    -1,    10,    62,
      -1,    -1,    10,    75,   106,    62,    -1,    -1,    72,    76,
      84,    62,    -1,    14,     4,    13,    62,    -1,    14,     4,
      62,    -1,    14,    62,    -1,     4,    62,    -1,     4,    84,
      62,    -1,     9,     4,    63,    64,    85,    62,    -1,     9,
       4,    84,    63,    64,    85,    62,    -1,    -1,     5,    85,
      62,    77,    79,     7,    62,    -1,    -1,     5,    62,    78,
      79,     7,    62,    -1,     5,     1,     7,    62,    -1,    -1,
      79,    80,    -1,    62,    -1,    81,    62,    -1,   105,    62,
      -1,   105,    85,    62,    -1,    82,    -1,    81,    64,    82,
      -1,   104,    -1,   104,    65,    85,    -1,    32,    -1,    33,
      -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,
      -1,    39,    -1,    40,    -1,    41,    -1,    85,    -1,    85,
      64,    -1,    85,    64,    84,    -1,    64,    84,    -1,    64,
      -1,    87,    -1,    85,    86,    87,    -1,    31,    -1,    89,
      -1,    87,    88,    89,    -1,    30,    -1,    91,    -1,    89,
      90,    91,    -1,    29,    -1,    93,    -1,    91,    92,    93,
      -1,    26,    -1,    27,    -1,    28,    -1,    95,    -1,    93,
      94,    95,    -1,    24,    -1,    25,    -1,    22,    -1,    23,
      -1,    20,    -1,    21,    -1,    97,    -1,    95,    96,    97,
      -1,    18,    -1,    19,    -1,    99,    -1,    97,    98,    99,
      -1,    55,    -1,    56,    -1,   101,    -1,    99,   100,   101,
      -1,    57,    -1,    58,    -1,    59,    -1,   103,    -1,   102,
     103,    -1,    15,    -1,    16,    -1,    17,    -1,    56,    -1,
      60,    -1,    61,    -1,    55,    -1,   104,    -1,    11,    -1,
      66,    -1,    13,    -1,    67,    85,    63,    -1,    53,    85,
      54,    -1,    57,    -1,    45,    -1,    46,    -1,    47,    -1,
       4,    -1,    51,    85,    63,    -1,    51,    85,    52,    -1,
       3,    -1,    50,    85,    63,    -1,    50,    85,    52,    -1,
     107,    -1,   107,    64,   106,    -1,    -1,     4,   108,    86,
      87,    -1,    87,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   306,   306,   310,   309,   315,   322,   334,   343,   352,
     361,   432,   444,   444,   447,   456,   456,   463,   468,   468,
     475,   475,   482,   488,   493,   498,   503,   508,   524,   541,
     540,   559,   558,   576,   582,   584,   591,   593,   600,   609,
     620,   622,   626,   633,   641,   641,   641,   642,   642,   642,
     642,   643,   643,   643,   646,   651,   656,   661,   666,   673,
     675,   683,   686,   688,   696,   699,   701,   709,   712,   714,
     722,   722,   722,   725,   727,   735,   735,   735,   735,   735,
     735,   738,   740,   748,   748,   751,   753,   761,   761,   764,
     766,   774,   774,   774,   777,   779,   786,   786,   786,   786,
     786,   786,   786,   789,   794,   799,   804,   809,   814,   819,
     824,   829,   834,   841,   846,   851,   859,   874,   883,   894,
     899,   907,   906,   918
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LABEL", "IDENTIFIER", "CBLOCK",
  "DEBUG_LINE", "ENDC", "ERRORLEVEL", "FILL", "LIST", "NUMBER",
  "PROCESSOR", "STRING", "DEFINE", "UPPER", "HIGH", "LOW", "LSH", "RSH",
  "GREATER_EQUAL", "LESS_EQUAL", "EQUAL", "NOT_EQUAL", "'<'", "'>'", "'&'",
  "'|'", "'^'", "LOGICAL_AND", "LOGICAL_OR", "'='", "ASSIGN_PLUS",
  "ASSIGN_MINUS", "ASSIGN_MULTIPLY", "ASSIGN_DIVIDE", "ASSIGN_MODULUS",
  "ASSIGN_LSH", "ASSIGN_RSH", "ASSIGN_AND", "ASSIGN_OR", "ASSIGN_XOR",
  "INCREMENT", "DECREMENT", "TBL_NO_CHANGE", "TBL_POST_INC",
  "TBL_POST_DEC", "TBL_PRE_INC", "CONCAT", "VAR", "VARLAB_BEGIN",
  "VAR_BEGIN", "VAR_END", "'['", "']'", "'+'", "'-'", "'*'", "'/'", "'%'",
  "'!'", "'~'", "'\\n'", "')'", "','", "':'", "'$'", "'('", "$accept",
  "program", "@1", "line", "decimal_ops", "statement", "@2", "@3", "@4",
  "@5", "@6", "const_block", "const_line", "const_def_list", "const_def",
  "assign_equal_ops", "parameter_list", "expr", "e9op", "e8", "e8op", "e7",
  "e7op", "e6", "e6op", "e5", "e5op", "e4", "e4op", "e3", "e3op", "e2",
  "e2op", "e1", "e1op", "e0", "cidentifier", "label_concat", "list_block",
  "list_expr", "@7", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,    60,    62,    38,   124,    94,   279,
     280,    61,   281,   282,   283,   284,   285,   286,   287,   288,
     289,   290,   291,   292,   293,   294,   295,   296,   297,   298,
     299,   300,   301,    91,    93,    43,    45,    42,    47,    37,
      33,   126,    10,    41,    44,    58,    36,    40
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    68,    69,    70,    69,    69,    71,    71,    71,    71,
      71,    71,    72,    72,    73,    74,    73,    73,    75,    73,
      76,    73,    73,    73,    73,    73,    73,    73,    73,    77,
      73,    78,    73,    73,    79,    79,    80,    80,    80,    80,
      81,    81,    82,    82,    83,    83,    83,    83,    83,    83,
      83,    83,    83,    83,    84,    84,    84,    84,    84,    85,
      85,    86,    87,    87,    88,    89,    89,    90,    91,    91,
      92,    92,    92,    93,    93,    94,    94,    94,    94,    94,
      94,    95,    95,    96,    96,    97,    97,    98,    98,    99,
      99,   100,   100,   100,   101,   101,   102,   102,   102,   102,
     102,   102,   102,   103,   103,   103,   103,   103,   103,   103,
     103,   103,   103,   104,   104,   104,   105,   105,   105,   106,
     106,   108,   107,   107
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     0,     3,     3,     4,     4,     3,     3,
       2,     1,     1,     1,     1,     0,     4,     2,     0,     4,
       0,     4,     4,     3,     2,     2,     3,     6,     7,     0,
       7,     0,     6,     4,     0,     2,     1,     2,     2,     3,
       1,     3,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     2,     3,     2,     1,     1,
       3,     1,     1,     3,     1,     1,     3,     1,     1,     3,
       1,     1,     1,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     3,     1,     1,     1,     3,     1,     1,     1,
       3,     1,     1,     1,     1,     2,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     3,     1,
       1,     1,     1,     1,     3,     3,     1,     3,     3,     1,
       3,     0,     4,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       2,     0,     1,     0,     0,     5,   116,     0,     0,    13,
      12,     0,    18,    15,     0,     0,    14,     4,    20,    11,
       0,   113,   104,   106,    96,    97,    98,   110,   111,   112,
       0,     0,   102,    99,   109,   100,   101,    25,    58,   105,
       0,     0,    54,    59,    62,    65,    68,    73,    81,    85,
      89,     0,    94,   103,     0,    31,     0,     0,    17,     0,
       0,     0,    24,     0,     0,     0,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,     0,     0,    10,     0,
       0,     0,    57,     0,    26,    61,    55,     0,    64,     0,
      67,     0,    70,    71,    72,     0,    79,    80,    77,    78,
      75,    76,     0,    83,    84,     0,    87,    88,     0,    91,
      92,    93,     0,    95,     0,    34,    29,     0,     0,   113,
     123,     0,   119,     0,     0,    23,   118,   117,     0,     0,
       9,     8,     0,   115,   114,   108,   107,    56,    60,    63,
      66,    69,    74,    82,    86,    90,    33,     0,    34,     0,
       0,     0,    19,     0,    16,    22,    21,     7,     6,     0,
      36,    35,     0,    40,    42,     0,     0,     0,     0,     0,
     120,    32,    37,     0,     0,    38,     0,     0,    27,     0,
     122,    41,    43,    39,    30,    28
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     4,    17,    18,    19,    60,    59,    64,   148,
     115,   147,   161,   162,   163,    79,    41,    42,    87,    43,
      89,    44,    91,    45,    95,    46,   102,    47,   105,    48,
     108,    49,   112,    50,    51,    52,    53,   165,   121,   122,
     151
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -60
static const yytype_int16 yypact[] =
{
     -60,   327,   -60,   -44,   272,   -60,   -60,    -2,    23,   -60,
     -60,    24,   -32,   -60,    -1,   184,   -60,   -60,   -60,   -60,
     359,   -60,   -60,   -60,   -60,   -60,   -60,   -60,   -60,   -60,
     184,   184,   -60,   -60,   -60,   -60,   -60,   -60,   108,   -60,
     184,   -29,   -27,    17,    34,    82,   169,     2,   -30,   127,
     -60,   259,   -60,   -60,    66,   -60,   -12,    83,   -60,   242,
      63,     4,   -60,   -21,   108,   184,   -60,   -60,   -60,   -60,
     -60,   -60,   -60,   -60,   -60,   -60,    30,    31,   -60,   184,
      50,   -19,   -60,   -15,   -60,   -60,   108,   184,   -60,   184,
     -60,   184,   -60,   -60,   -60,   184,   -60,   -60,   -60,   -60,
     -60,   -60,   184,   -60,   -60,   184,   -60,   -60,   184,   -60,
     -60,   -60,   184,   -60,    35,   -60,   -60,    39,    42,    75,
      17,    53,    52,    56,    58,   -60,   -60,   -60,    64,    10,
     -60,   -60,    15,   -60,   -60,   -60,   -60,   -60,    17,    34,
      82,   169,     2,   -30,   127,   -60,   -60,   211,   -60,   184,
      67,    96,   -60,   242,   -60,   -60,   -60,   -60,   -60,    71,
     -60,   -60,   -56,   -60,    72,   166,   310,    55,   184,   184,
     -60,   -60,   -60,     1,   184,   -60,    60,    73,   -60,    70,
      17,   -60,    96,   -60,   -60,   -60
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -60,   -60,   -60,   -60,   -60,   122,   -60,   -60,   -60,   -60,
     -60,    -3,   -60,   -60,   -25,   -60,    18,    -8,     0,   -58,
     -60,    69,   -60,    61,   -60,    76,   -60,    54,   -60,    57,
     -60,    59,   -60,    68,   -60,   125,   -59,   174,    20,   -60,
     -60
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -122
static const yytype_int16 yytable[] =
{
      56,   120,    21,    61,    85,    21,   172,    63,   173,    22,
      85,    23,    85,    24,    25,    26,    85,   124,     5,    85,
     103,   104,    80,    81,    54,   106,   107,    21,    57,   138,
      58,   126,    83,    84,    22,   135,    23,    86,    24,    25,
      26,    85,   127,    27,    28,    29,    85,    88,   136,    30,
     116,    31,    30,    32,    33,    34,    82,   129,    35,    36,
      37,    62,    38,    90,    39,    40,   125,   123,    27,    28,
      29,   132,   157,   114,    30,   118,    31,   158,    32,    33,
      34,    85,   128,    35,    36,    55,    85,    21,   164,    39,
      40,    85,   130,   131,    22,   120,    23,   146,    24,    25,
      26,    85,   133,   149,   137,   150,  -121,   164,    92,    93,
      94,   180,    21,   134,   164,   152,   153,   178,   154,    22,
     155,    23,   183,    24,    25,    26,   156,    85,    27,    28,
      29,   168,   185,   171,    30,   184,    31,   174,    32,    33,
      34,   167,    78,    35,    36,   166,   117,    38,   181,    39,
      40,   169,   140,    27,    28,    29,   142,   176,   139,    30,
     179,    31,   143,    32,    33,    34,   182,   144,    35,    36,
      21,   141,    38,   170,    39,    40,   113,    22,    20,    23,
     145,    24,    25,    26,   109,   110,   111,     0,    21,    96,
      97,    98,    99,   100,   101,    22,     0,    23,     0,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,    28,    29,     6,    21,     0,    30,   159,    31,
       0,    32,    33,    34,     0,     0,    35,    36,   175,    27,
      28,    29,    39,    40,     0,    30,     0,    31,     0,    32,
      33,    34,     0,     0,    35,    36,   119,     0,     0,     0,
      39,    40,     0,    22,     0,    23,     0,    24,    25,    26,
       0,    15,    30,    21,     0,     0,     0,     0,     0,     0,
      22,     0,    23,   160,     0,     6,     7,     8,     9,     0,
      10,    11,    12,     0,    13,     0,    14,    27,    28,    29,
       0,     0,     0,    30,     0,    31,     0,    32,    33,    34,
       0,     0,    35,    36,    27,    28,    29,     0,    39,    40,
      30,     0,    31,     6,    21,     0,    34,   177,     0,     0,
       0,     0,    15,     0,     0,    39,    40,     2,     3,     0,
      -3,    -3,    -3,    -3,    16,    -3,    -3,    -3,     0,    -3,
       0,    -3,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      15,    30,     0,     7,     8,     9,     0,    10,    11,    12,
       0,    13,   160,    14,     0,     0,     0,    -3,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    -3,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    16
};

static const yytype_int16 yycheck[] =
{
       8,    59,     4,     4,    31,     4,    62,    15,    64,    11,
      31,    13,    31,    15,    16,    17,    31,    13,    62,    31,
      18,    19,    30,    31,     1,    55,    56,     4,     4,    87,
      62,    52,    40,    62,    11,    54,    13,    64,    15,    16,
      17,    31,    63,    45,    46,    47,    31,    30,    63,    51,
      62,    53,    51,    55,    56,    57,    38,    65,    60,    61,
      62,    62,    64,    29,    66,    67,    62,     4,    45,    46,
      47,    79,    62,     7,    51,    57,    53,    62,    55,    56,
      57,    31,    64,    60,    61,    62,    31,     4,   147,    66,
      67,    31,    62,    62,    11,   153,    13,    62,    15,    16,
      17,    31,    52,    64,    86,    63,    31,   166,    26,    27,
      28,   169,     4,    63,   173,    62,    64,    62,    62,    11,
      62,    13,    62,    15,    16,    17,    62,    31,    45,    46,
      47,    64,    62,    62,    51,    62,    53,    65,    55,    56,
      57,   149,    20,    60,    61,   148,    63,    64,   173,    66,
      67,   151,    91,    45,    46,    47,   102,   165,    89,    51,
     168,    53,   105,    55,    56,    57,   174,   108,    60,    61,
       4,    95,    64,   153,    66,    67,    51,    11,     4,    13,
     112,    15,    16,    17,    57,    58,    59,    -1,     4,    20,
      21,    22,    23,    24,    25,    11,    -1,    13,    -1,    15,
      16,    17,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    45,    46,    47,     3,     4,    -1,    51,     7,    53,
      -1,    55,    56,    57,    -1,    -1,    60,    61,    62,    45,
      46,    47,    66,    67,    -1,    51,    -1,    53,    -1,    55,
      56,    57,    -1,    -1,    60,    61,     4,    -1,    -1,    -1,
      66,    67,    -1,    11,    -1,    13,    -1,    15,    16,    17,
      -1,    50,    51,     4,    -1,    -1,    -1,    -1,    -1,    -1,
      11,    -1,    13,    62,    -1,     3,     4,     5,     6,    -1,
       8,     9,    10,    -1,    12,    -1,    14,    45,    46,    47,
      -1,    -1,    -1,    51,    -1,    53,    -1,    55,    56,    57,
      -1,    -1,    60,    61,    45,    46,    47,    -1,    66,    67,
      51,    -1,    53,     3,     4,    -1,    57,     7,    -1,    -1,
      -1,    -1,    50,    -1,    -1,    66,    67,     0,     1,    -1,
       3,     4,     5,     6,    62,     8,     9,    10,    -1,    12,
      -1,    14,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      50,    51,    -1,     4,     5,     6,    -1,     8,     9,    10,
      -1,    12,    62,    14,    -1,    -1,    -1,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    62,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    62
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    69,     0,     1,    70,    62,     3,     4,     5,     6,
       8,     9,    10,    12,    14,    50,    62,    71,    72,    73,
     105,     4,    11,    13,    15,    16,    17,    45,    46,    47,
      51,    53,    55,    56,    57,    60,    61,    62,    64,    66,
      67,    84,    85,    87,    89,    91,    93,    95,    97,    99,
     101,   102,   103,   104,     1,    62,    85,     4,    62,    75,
      74,     4,    62,    85,    76,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    73,    83,
      85,    85,    84,    85,    62,    31,    64,    86,    30,    88,
      29,    90,    26,    27,    28,    92,    20,    21,    22,    23,
      24,    25,    94,    18,    19,    96,    55,    56,    98,    57,
      58,    59,   100,   103,     7,    78,    62,    63,    84,     4,
      87,   106,   107,     4,    13,    62,    52,    63,    84,    85,
      62,    62,    85,    52,    63,    54,    63,    84,    87,    89,
      91,    93,    95,    97,    99,   101,    62,    79,    77,    64,
      63,   108,    62,    64,    62,    62,    62,    62,    62,     7,
      62,    80,    81,    82,   104,   105,    79,    85,    64,    86,
     106,    62,    62,    64,    65,    62,    85,     7,    62,    85,
      87,    82,    85,    62,    62,    62
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 3:
#line 310 "parse.y"
    { 
          state.lst.line.was_org = state.org; 
          state.lst.line.linetype = none; 
          state.next_state = state_nochange;
        }
    break;

  case 5:
#line 316 "parse.y"
    { 
	  next_line(0);
	}
    break;

  case 6:
#line 323 "parse.y"
    {
	  struct pnode *parms;
	  int exp_result;

          exp_result = do_insn("set", mk_list((yyvsp[(3) - (4)].p), NULL));          
          parms = mk_list(mk_2op(return_op((yyvsp[(2) - (4)].i)), 
                                 mk_symbol((yyvsp[(1) - (4)].s)), 
                                 mk_constant(exp_result)), NULL);
	  next_line(set_label((yyvsp[(1) - (4)].s), parms));
	}
    break;

  case 7:
#line 335 "parse.y"
    {
	  struct pnode *parms;

	  /* implements i = 6 + 1 */           
	  parms = mk_list((yyvsp[(3) - (4)].p), NULL);
	  next_line(set_label((yyvsp[(1) - (4)].s), parms));
	}
    break;

  case 8:
#line 344 "parse.y"
    {
	  struct pnode *parms;

	  /* implements i-- */           
	  parms = mk_list(mk_1op(DECREMENT, mk_symbol((yyvsp[(1) - (3)].s))), NULL);
	  next_line(set_label((yyvsp[(1) - (3)].s), parms));
	}
    break;

  case 9:
#line 353 "parse.y"
    {
          struct pnode *parms;

	  /* implements i++ */          
	  parms = mk_list(mk_1op(INCREMENT, mk_symbol((yyvsp[(1) - (3)].s))), NULL);
	  next_line(set_label((yyvsp[(1) - (3)].s), parms));
	}
    break;

  case 10:
#line 362 "parse.y"
    {
	  if (asm_enabled() && (state.lst.line.linetype == none)) {
	    if ((state.mode == relocatable) &&
                (SECTION_FLAGS & (STYP_BSS | STYP_DATA)))
          /* alias to next definition */
          state.lst.line.linetype = res;
        else
	      state.lst.line.linetype = insn;
	  }
	  
	  if (asm_enabled()) {
	    if (state.mac_head) {
	      /* This is a macro definition.  Set it up */
	      struct symbol *mac;
	      struct macro_head *h = NULL;

	      mac = get_symbol(state.stMacros, (yyvsp[(1) - (2)].s));
	      if (mac)
		h = get_symbol_annotation(mac);

	      /* It's not an error if macro was defined on pass 1 and
		 we're in pass 2. */
	      if (h &&
		  !((h->pass == 1) && (state.pass == 2))) {
		gperror(GPE_DUPLICATE_MACRO, NULL);
	      } else {
		if (!mac)
		  mac = add_symbol(state.stMacros, (yyvsp[(1) - (2)].s));
		annotate_symbol(mac, state.mac_head);
		h = state.mac_head;
		h->line_number = state.src->line_number;
		h->file_symbol = state.src->file_symbol;
	      }
	      h->pass = state.pass;
 	      
	      /* The macro is defined so allow calls. */
	      if (state.pass == 2)
	        h->defined = 1;

	      state.mac_head = NULL;
	    } else if (!state.mac_prev) {
	      /* Outside a macro, just define the label. */
	      switch (state.lst.line.linetype) {
	      case sec:
		strncpy(state.obj.new_sec_name, (yyvsp[(1) - (2)].s), 78);
		break;
	      case set:
		set_global((yyvsp[(1) - (2)].s), (yyvsp[(2) - (2)].i), TEMPORARY, gvt_constant);
		break;
              case org:
	      case equ:
		set_global((yyvsp[(1) - (2)].s), (yyvsp[(2) - (2)].i), PERMANENT, gvt_constant);
		break;
	      case insn:
		set_global((yyvsp[(1) - (2)].s), ((yyvsp[(2) - (2)].i) << _16bit_core) - _16packed_offset_labels, PERMANENT, gvt_address);
		break;
	      case res:
		set_global((yyvsp[(1) - (2)].s), (yyvsp[(2) - (2)].i), PERMANENT, gvt_static);
                break;
	      case dir:
                gperror(GPE_ILLEGAL_LABEL, NULL);
                break;
              default:
		break;
	      }
	    }
	  }
	  next_line((yyvsp[(2) - (2)].i));
	}
    break;

  case 11:
#line 433 "parse.y"
    {
	  if (state.mac_head) {
	    /* This is a macro definition, but the label was missing */
	    state.mac_head = NULL;
	    gperror(GPE_NO_MACRO_NAME, NULL);
	  } else {
	    next_line(0);
	  }
	}
    break;

  case 14:
#line 448 "parse.y"
    {
	  if (!state.mac_prev) {
	    (yyval.i) = state.org;
	  } else {
	    macro_append();
	  }
	}
    break;

  case 15:
#line 456 "parse.y"
    {  force_ident = 1; }
    break;

  case 16:
#line 458 "parse.y"
    {
	  (yyval.i) = do_or_append_insn((yyvsp[(1) - (4)].s), mk_list(mk_symbol((yyvsp[(3) - (4)].s)), NULL));
	  force_ident = 0;
	}
    break;

  case 17:
#line 464 "parse.y"
    {
	  (yyval.i) = do_or_append_insn((yyvsp[(1) - (2)].s), NULL);
	}
    break;

  case 18:
#line 468 "parse.y"
    {  force_decimal = 1; }
    break;

  case 19:
#line 470 "parse.y"
    {
	  (yyval.i) = do_or_append_insn((yyvsp[(1) - (4)].s), (yyvsp[(3) - (4)].p));
	  force_decimal = 0;
	}
    break;

  case 20:
#line 475 "parse.y"
    {  force_decimal = 1; }
    break;

  case 21:
#line 477 "parse.y"
    {
	  (yyval.i) = do_or_append_insn((yyvsp[(1) - (4)].s), (yyvsp[(3) - (4)].p));
	  force_decimal = 0;
	}
    break;

  case 22:
#line 483 "parse.y"
    {
	  (yyval.i) = do_or_append_insn((yyvsp[(1) - (4)].s), mk_list(mk_string((yyvsp[(2) - (4)].s)),
	      mk_list(mk_string((yyvsp[(3) - (4)].s)), NULL)));
	}
    break;

  case 23:
#line 489 "parse.y"
    {
	  (yyval.i) = do_or_append_insn((yyvsp[(1) - (3)].s), mk_list(mk_string((yyvsp[(2) - (3)].s)), NULL));
	}
    break;

  case 24:
#line 494 "parse.y"
    {
	  (yyval.i) = do_or_append_insn((yyvsp[(1) - (2)].s), NULL);
	}
    break;

  case 25:
#line 499 "parse.y"
    {
	  (yyval.i) = do_or_append_insn((yyvsp[(1) - (2)].s), NULL);
	}
    break;

  case 26:
#line 504 "parse.y"
    {
	  (yyval.i) = do_or_append_insn((yyvsp[(1) - (3)].s), (yyvsp[(2) - (3)].p));
	}
    break;

  case 27:
#line 509 "parse.y"
    {
	  int number;
	  int i;

          if (!state.mac_prev) {
            number = eval_fill_number((yyvsp[(5) - (6)].p));

            for (i = 0; i < number; i++) {
              (yyval.i) = do_insn((yyvsp[(2) - (6)].s), NULL);
            }
          } else {
	    macro_append();
	  }
	}
    break;

  case 28:
#line 525 "parse.y"
    {
	  int number;
	  int i;

          if (!state.mac_prev) {
            number = eval_fill_number((yyvsp[(6) - (7)].p));

            for (i = 0; i < number; i++) {
              (yyval.i) = do_insn((yyvsp[(2) - (7)].s), (yyvsp[(3) - (7)].p));
            }
          } else {
	    macro_append();
	  }
	}
    break;

  case 29:
#line 541 "parse.y"
    {
	  if (!state.mac_prev) {
	    begin_cblock((yyvsp[(2) - (3)].p));
	  } else {
	    macro_append();
	  }
	  next_line(0);
	}
    break;

  case 30:
#line 551 "parse.y"
    {
	  if (state.mac_prev) {
	    macro_append();
	  }
	  (yyval.i) = 0;
	}
    break;

  case 31:
#line 559 "parse.y"
    {
	  if (!state.mac_prev) {
	    continue_cblock();
	  } else {
	    macro_append();
	  }
	  next_line(0);
	}
    break;

  case 32:
#line 569 "parse.y"
    {
	  if (state.mac_prev) {
	    macro_append();
	  }
	  (yyval.i) = 0;
	}
    break;

  case 33:
#line 577 "parse.y"
    {
	  (yyval.i) = 0;
  	}
    break;

  case 35:
#line 585 "parse.y"
    {
	  next_line(0);
	}
    break;

  case 37:
#line 594 "parse.y"
    {
	  if (state.mac_prev) {
	    macro_append();
	  }
	}
    break;

  case 38:
#line 601 "parse.y"
    {
	  if (!state.mac_prev) {
	    cblock_expr(mk_symbol((yyvsp[(1) - (2)].s)));
	  } else {
	    macro_append();
	  }
	}
    break;

  case 39:
#line 610 "parse.y"
    {
	  if (!state.mac_prev) {
	    cblock_expr_incr(mk_symbol((yyvsp[(1) - (3)].s)), (yyvsp[(2) - (3)].p));
	  } else {
	    macro_append();
	  }
	}
    break;

  case 42:
#line 627 "parse.y"
    {
	  if (!state.mac_prev) {
	    cblock_expr((yyvsp[(1) - (1)].p));
	  }
	}
    break;

  case 43:
#line 634 "parse.y"
    {
	  if (!state.mac_prev) {
	    cblock_expr_incr((yyvsp[(1) - (3)].p), (yyvsp[(3) - (3)].p));
	  }
	}
    break;

  case 54:
#line 647 "parse.y"
    {
	  (yyval.p) = mk_list((yyvsp[(1) - (1)].p), NULL);
	}
    break;

  case 55:
#line 652 "parse.y"
    {
          (yyval.p) = mk_list((yyvsp[(1) - (2)].p), mk_list(mk_symbol(""), NULL));
	}
    break;

  case 56:
#line 657 "parse.y"
    {
	  (yyval.p) = mk_list((yyvsp[(1) - (3)].p), (yyvsp[(3) - (3)].p));
	}
    break;

  case 57:
#line 662 "parse.y"
    {
	  (yyval.p) = mk_list(mk_symbol(""), (yyvsp[(2) - (2)].p));
	}
    break;

  case 58:
#line 667 "parse.y"
    {
	  (yyval.p) = mk_list(mk_symbol(""), mk_list(mk_symbol(""), NULL));
	}
    break;

  case 60:
#line 676 "parse.y"
    {
	  coerce_str1((yyvsp[(1) - (3)].p));
	  coerce_str1((yyvsp[(3) - (3)].p));
	  (yyval.p) = mk_2op((yyvsp[(2) - (3)].i), (yyvsp[(1) - (3)].p), (yyvsp[(3) - (3)].p));
	}
    break;

  case 63:
#line 689 "parse.y"
    {
	  coerce_str1((yyvsp[(1) - (3)].p));
	  coerce_str1((yyvsp[(3) - (3)].p));
	  (yyval.p) = mk_2op((yyvsp[(2) - (3)].i), (yyvsp[(1) - (3)].p), (yyvsp[(3) - (3)].p));
	}
    break;

  case 66:
#line 702 "parse.y"
    {
	  coerce_str1((yyvsp[(1) - (3)].p));
	  coerce_str1((yyvsp[(3) - (3)].p));
	  (yyval.p) = mk_2op((yyvsp[(2) - (3)].i), (yyvsp[(1) - (3)].p), (yyvsp[(3) - (3)].p));
	}
    break;

  case 69:
#line 715 "parse.y"
    {
	  coerce_str1((yyvsp[(1) - (3)].p));
	  coerce_str1((yyvsp[(3) - (3)].p));
	  (yyval.p) = mk_2op((yyvsp[(2) - (3)].i), (yyvsp[(1) - (3)].p), (yyvsp[(3) - (3)].p));
	}
    break;

  case 74:
#line 728 "parse.y"
    {
	  coerce_str1((yyvsp[(1) - (3)].p));
	  coerce_str1((yyvsp[(3) - (3)].p));
	  (yyval.p) = mk_2op((yyvsp[(2) - (3)].i), (yyvsp[(1) - (3)].p), (yyvsp[(3) - (3)].p));
	}
    break;

  case 82:
#line 741 "parse.y"
    {
	  coerce_str1((yyvsp[(1) - (3)].p));
	  coerce_str1((yyvsp[(3) - (3)].p));
	  (yyval.p) = mk_2op((yyvsp[(2) - (3)].i), (yyvsp[(1) - (3)].p), (yyvsp[(3) - (3)].p));
	}
    break;

  case 86:
#line 754 "parse.y"
    {
	  coerce_str1((yyvsp[(1) - (3)].p));
	  coerce_str1((yyvsp[(3) - (3)].p));
	  (yyval.p) = mk_2op((yyvsp[(2) - (3)].i), (yyvsp[(1) - (3)].p), (yyvsp[(3) - (3)].p));
	}
    break;

  case 90:
#line 767 "parse.y"
    {
	  coerce_str1((yyvsp[(1) - (3)].p));
	  coerce_str1((yyvsp[(3) - (3)].p));
	  (yyval.p) = mk_2op((yyvsp[(2) - (3)].i), (yyvsp[(1) - (3)].p), (yyvsp[(3) - (3)].p));
	}
    break;

  case 95:
#line 780 "parse.y"
    {
	  coerce_str1((yyvsp[(2) - (2)].p));
	  (yyval.p) = mk_1op((yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].p));
	}
    break;

  case 103:
#line 790 "parse.y"
    {
	  (yyval.p) = (yyvsp[(1) - (1)].p);
        }
    break;

  case 104:
#line 795 "parse.y"
    {
	  (yyval.p) = mk_constant((yyvsp[(1) - (1)].i));
	}
    break;

  case 105:
#line 800 "parse.y"
    {
	  (yyval.p) = mk_symbol("$");
	}
    break;

  case 106:
#line 805 "parse.y"
    {
	  (yyval.p) = mk_string((yyvsp[(1) - (1)].s));
	}
    break;

  case 107:
#line 810 "parse.y"
    {
	  (yyval.p) = (yyvsp[(2) - (3)].p);
	}
    break;

  case 108:
#line 815 "parse.y"
    {
	  (yyval.p) = mk_offset((yyvsp[(2) - (3)].p));
	}
    break;

  case 109:
#line 820 "parse.y"
    {
	  (yyval.p) = mk_constant(TBL_NO_CHANGE);
	}
    break;

  case 110:
#line 825 "parse.y"
    {
	  (yyval.p) = mk_constant((yyvsp[(1) - (1)].i));
	}
    break;

  case 111:
#line 830 "parse.y"
    {
	  (yyval.p) = mk_constant((yyvsp[(1) - (1)].i));
	}
    break;

  case 112:
#line 835 "parse.y"
    {
	  (yyval.p) = mk_constant((yyvsp[(1) - (1)].i));
	}
    break;

  case 113:
#line 842 "parse.y"
    { 
          (yyval.p) = mk_symbol((yyvsp[(1) - (1)].s));
        }
    break;

  case 114:
#line 847 "parse.y"
    {
          (yyval.p) = mk_2op(CONCAT, mk_symbol((yyvsp[(1) - (3)].s)), mk_1op(VAR, (yyvsp[(2) - (3)].p)));
        }
    break;

  case 115:
#line 852 "parse.y"
    {
          (yyval.p) = mk_2op(CONCAT, mk_symbol((yyvsp[(1) - (3)].s)), 
                        mk_2op(CONCAT, mk_1op(VAR, (yyvsp[(2) - (3)].p)), mk_symbol((yyvsp[(3) - (3)].s))));
        }
    break;

  case 116:
#line 860 "parse.y"
    { 
          (yyval.s) = (yyvsp[(1) - (1)].s);

	  /*
	   * statements return their org - but, with 16bit cores, org is a word
	   * address. for us to know whether a label points at a non word aligned
	   * address, we must get status from the directive.c module through a
	   * back channel. however, we must make sure to store this status before
	   * any statement on the current line is processed, so we must save it here
	   * before the statement rules run.
	   */
	  _16packed_offset_labels = _16packed_byte_acc;
        }
    break;

  case 117:
#line 875 "parse.y"
    {
          if (asm_enabled() && !state.mac_prev) {
	    (yyval.s) = evaluate_concatenation(mk_2op(CONCAT,  mk_symbol((yyvsp[(1) - (3)].s)), 
                           mk_1op(VAR, (yyvsp[(2) - (3)].p))));
	  _16packed_offset_labels = _16packed_byte_acc;
	  }
        }
    break;

  case 118:
#line 884 "parse.y"
    {
          if (asm_enabled() && !state.mac_prev) {
            (yyval.s) = evaluate_concatenation(mk_2op(CONCAT,  mk_symbol((yyvsp[(1) - (3)].s)), 
                      mk_2op(CONCAT, mk_1op(VAR, (yyvsp[(2) - (3)].p)), mk_symbol((yyvsp[(3) - (3)].s)))));
	  _16packed_offset_labels = _16packed_byte_acc;
	  }
        }
    break;

  case 119:
#line 895 "parse.y"
    {
	  (yyval.p) = mk_list((yyvsp[(1) - (1)].p), NULL);
	}
    break;

  case 120:
#line 900 "parse.y"
    {
	  (yyval.p) = mk_list((yyvsp[(1) - (3)].p), (yyvsp[(3) - (3)].p));
	}
    break;

  case 121:
#line 907 "parse.y"
    {
	  if ((strcasecmp((yyvsp[(1) - (1)].s), "p") == 0) || (strcasecmp((yyvsp[(1) - (1)].s), "pe") == 0)) { 
            force_ident = 1;
          }
        }
    break;

  case 122:
#line 913 "parse.y"
    {
	  (yyval.p) = mk_2op((yyvsp[(3) - (4)].i), mk_symbol((yyvsp[(1) - (4)].s)), (yyvsp[(4) - (4)].p));
	  force_ident = 0;
	}
    break;

  case 123:
#line 919 "parse.y"
    {
	  (yyval.p) = (yyvsp[(1) - (1)].p);
	}
    break;


/* Line 1267 of yacc.c.  */
#line 2514 "parse.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 924 "parse.y"


int return_op(int operation) 
{
  /* returns an operator for the replacement of i+=1 with i=i+1*/
  switch(operation) {
  case ASSIGN_PLUS:     return '+';
  case ASSIGN_MINUS:    return '-';
  case ASSIGN_MULTIPLY: return '*';
  case ASSIGN_DIVIDE:   return '/';
  case ASSIGN_MODULUS:  return '%';
  case ASSIGN_LSH:      return LSH;
  case ASSIGN_RSH:      return RSH;
  case ASSIGN_AND:      return '&';
  case ASSIGN_OR:       return '|';
  case ASSIGN_XOR:      return '^'; 
  default:
    assert(0); /* Unhandled operator */ 
  }

  return 0;
}

