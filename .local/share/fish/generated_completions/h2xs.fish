# h2xs
# Autogenerated from man page /usr/share/man/man1/h2xs.1
complete -c h2xs -s A -l omit-autoload --description 'Omit all autoload facilities.'
complete -c h2xs -s B -l beta-version --description 'Use an alpha/beta style version number.   Causes version number to be \\*(L"0.'
complete -c h2xs -s C -l omit-changes --description 'Omits creation of the Changes file, and adds a \\s-1HISTORY\\s0 section to the …'
complete -c h2xs -s F -l cpp-flags --description 'Additional flags to specify to C preprocessor when scanning header for functi…'
complete -c h2xs -s M -l func-mask --description 'selects functions/macros to process.'
complete -c h2xs -s O -l overwrite-ok --description 'Allows a pre-existing extension directory to be overwritten.'
complete -c h2xs -s P -l omit-pod --description 'Omit the autogenerated stub \\s-1POD\\s0 section.'
complete -c h2xs -s X -l omit-XS --description 'Omit the \\s-1XS\\s0 portion.  Used to generate a skeleton pure Perl module.'
complete -c h2xs -s a -l gen-accessors --description 'Generate an accessor method for each element of structs and unions.'
complete -c h2xs -s b -l compat-version --description 'Generates a .'
complete -c h2xs -s c -l omit-constant --description 'Omit \\f(CW\\*(C`constant()\\*(C\' from the .'
complete -c h2xs -s d -l debugging --description 'Turn on debugging messages.'
complete -c h2xs -s e -l omit-enums --description 'If regular expression is not given, skip all constants that are defined in a …'
complete -c h2xs -s f -l force --description 'Allows an extension to be created for a header even if that header is not fou…'
complete -c h2xs -s g -l global --description 'Include code for safely storing static data in the . xs file.'
complete -c h2xs -s h -s '?' -l help --description 'Print the usage, help and version for this h2xs and exit.'
complete -c h2xs -s k -l omit-const-func --description 'For function arguments declared as \\f(CW\\*(C`const\\*(C\', omit the const attri…'
complete -c h2xs -s m -l gen-tied-var --description 'Experimental: for each variable declared in the header file(s), declare a per…'
complete -c h2xs -s n -l name --description 'Specifies a name to be used for the extension, e. g. , -n\\s-1RPC::DCE\\s0.'
complete -c h2xs -s o -l opaque-re --description 'Use \\*(L"opaque\\*(R" data type for the C types matched by the regular express…'
complete -c h2xs -s p -l remove-prefix --description 'Specify a prefix which should be removed from the Perl function names, e. g.'
complete -c h2xs -s s -l const-subs --description 'Create a perl subroutine for the specified macros rather than autoload with t…'
complete -c h2xs -s t -l default-type --description 'Specify the internal type that the constant() mechanism uses for macros.'
complete -c h2xs -l use-new-tests --description 'When --compat-version (-b) is present the generated tests will use \\f(CW\\*(C`…'
complete -c h2xs -l use-old-tests --description 'Will force the generation of test code that uses the older \\f(CW\\*(C`Test\\*(C…'
complete -c h2xs -l skip-exporter --description 'Do not use \\f(CW\\*(C`Exporter\\*(C\' and/or export any symbol.'
complete -c h2xs -l skip-ppport --description 'Do not use \\f(CW\\*(C`Devel::PPPort\\*(C\': no portability to older version.'
complete -c h2xs -l skip-autoloader --description 'Do not use the module \\f(CW\\*(C`AutoLoader\\*(C\'; but keep the constant() func…'
complete -c h2xs -l skip-strict --description 'Do not use the pragma \\f(CW\\*(C`strict\\*(C\'.'
complete -c h2xs -l skip-warnings --description 'Do not use the pragma \\f(CW\\*(C`warnings\\*(C\'.'
complete -c h2xs -s v -l version --description 'Specify a version number for this extension.'

