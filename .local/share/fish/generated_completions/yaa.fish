# yaa
# Autogenerated from man page /usr/share/man/man1/yaa.1
complete -c yaa -s v --description 'Increase verbosity.  Default is silent operation.'
complete -c yaa -s h --description 'Print usage and exit.'
complete -c yaa -o dtarget_dir --description 'Target directory.  Default is the current directory.'
complete -c yaa -o iinput_file --description 'Input file.  Default is stdin.'
complete -c yaa -o ioffsetinput_offset --description 'Bytes to skip in input_file.'
complete -c yaa -o isizeinput_size --description 'Bytes to read from input_file.  Default is -1 to read all available data.'
complete -c yaa -o iindexinput_index --description 'YAA index corresponding to input_file.'
complete -c yaa -o ooutput_file --description 'Output file.  Default is stdout.'
complete -c yaa -o aalgorithm --description 'Compression algorithm used when creating archives.'
complete -c yaa -o bblock_size --description 'Block size used when compressing archives, a number with optional b,k,m,g suf…'
complete -c yaa -o tworker_threads --description 'Number of worker threads compressing/decompressing data.'
complete -c yaa -o wtwriter_threads --description 'Number of writer threads extracting archive content.'
complete -c yaa -o exclude-metadata --description 'Skip insertion of a leading metadata entry in the generated archives.'
complete -c yaa -o include-pathprefix --description 'Include entry paths matching prefix.  This option can be given multiple times.'
complete -c yaa -o exclude-pathprefix --description 'Exclude entry paths matching prefix.  This option can be given multiple times.'
complete -c yaa -o 'include-path-list<prefix_list_file>' --description 'File containing a list of path prefixes to include, one entry per line.'
complete -c yaa -o 'exclude-path-list<prefix_list_file>' --description 'File containing a list of path prefixes to exclude, one entry per line.'
complete -c yaa -o exclude-namename --description 'Exclude entry paths where a single component of the path matches exactly name.'
complete -c yaa -o 'include-type<type_spec>' --description 'Include only entries matching the given types.'
complete -c yaa -o 'exclude-type<type_spec>' --description 'Exclude only entries matching the given types.'
complete -c yaa -o 'include-field<field_spec>' --description 'Add the given fields to the set of fields to include with each entry.'
complete -c yaa -o 'exclude-field<field_spec>' --description 'Remove the given fields to the set of fields to include with each entry.'
complete -c yaa -o manifest --description 'Alias for the following options: . br -exclude-field dat .'
complete -c yaa -o index --description 'Alias for the following options: . br -exclude-field all .'
complete -c yaa -s d --description 'Target directory.  Default is the current directory.'
complete -c yaa -s i --description 'Input file.  Default is stdin.'
complete -c yaa -o ioffset --description 'Bytes to skip in input_file.'
complete -c yaa -o isize --description 'Bytes to read from input_file.  Default is -1 to read all available data.'
complete -c yaa -o iindex --description 'YAA index corresponding to input_file.'
complete -c yaa -s o --description 'Output file.  Default is stdout.'
complete -c yaa -s a --description 'Compression algorithm used when creating archives.'
complete -c yaa -s b --description 'Block size used when compressing archives, a number with optional b,k,m,g suf…'
complete -c yaa -s t --description 'Number of worker threads compressing/decompressing data.'
complete -c yaa -o wt --description 'Number of writer threads extracting archive content.'
complete -c yaa -o include-path --description 'Include entry paths matching prefix.  This option can be given multiple times.'
complete -c yaa -o exclude-path --description 'Exclude entry paths matching prefix.  This option can be given multiple times.'
complete -c yaa -o include-path-list --description 'File containing a list of path prefixes to include, one entry per line.'
complete -c yaa -o exclude-path-list --description 'File containing a list of path prefixes to exclude, one entry per line.'
complete -c yaa -o exclude-name --description 'Exclude entry paths where a single component of the path matches exactly name.'
complete -c yaa -o include-type --description 'Include only entries matching the given types.'
complete -c yaa -o exclude-type --description 'Exclude only entries matching the given types.'
complete -c yaa -o include-field --description 'Add the given fields to the set of fields to include with each entry.'
complete -c yaa -o exclude-field --description 'Remove the given fields to the set of fields to include with each entry.'

