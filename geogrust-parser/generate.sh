export lib_path='antlr4-4.8-2-SNAPSHOT-complete.jar'

cd lib || exit
if [ ! -f $lib_path ]; then
  wget https://github.com/rrevenantt/antlr4rust/releases/download/antlr4-4.8-2-Rust-0.2/$lib_path || exit
fi

cd ../src/grammer/impl || exit
cp ../*.g4 . || exit

java -jar ../../../lib/$lib_path -Dlanguage=Rust *.g4 -package grammer.impl || exit
