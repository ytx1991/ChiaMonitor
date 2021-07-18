for filename in nft-*.log; do
    [ -e "$filename" ] || continue
    grep  ' ' $filename | tr '\n' ' ' > one_line_$filename.log
done