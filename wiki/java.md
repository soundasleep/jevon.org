---
layout: page
title:  "Java"
author: jevon
date:   2012-12-08 19:13:51 +1300
---

Is a programming language. See also [[Eclipse]], [[EMF]], [[JMonkeyEngine]].

# <a href="http://code.google.com/p/iaml/source/browse/branches/2008-11-versioning/org.openiaml.model.diagram.custom/src/org/openiaml/model/diagram/custom/actions/MigrateModelAction.java?spec=svn337&r=337#189">Loading an XML DOM Document from an InputStream or IFile</a>
# <a href="http://code.google.com/p/iaml/source/browse/branches/2008-11-versioning/org.openiaml.model.diagram.custom/src/org/openiaml/model/diagram/custom/migrate/Migrate0To1.java?spec=svn337&r=337#72">Writing an XML DOM Document into an InputStream or IFile</a>
# <a href="http://code.google.com/p/iaml/source/browse/branches/2008-11-versioning/org.openiaml.model.diagram.custom/src/org/openiaml/model/diagram/custom/migrate/Migrate0To1.java?spec=svn337&r=337#192">Traversing an XML DOM document and creating new elements</a>
# <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/DijkstraAlgorithm.java">An Abstract implementation of Dijkstra's Algorithm in Java</a> and <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/TestComposition.java?spec=svn498&r=498#81">a concrete implementation using EClass composition</a>.
# [[Writing a String to a File in Java]]
# <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/XmlTestCase.java?spec=svn676&r=676#285">Reading and Writing Strings to Files in Java</a> (<a href="http://www.javapractices.com/topic/TopicAction.do?Id=42">reference</a>)
# [[Out of Memory in Java]]
# <a href="http://journals.jevon.org/users/jevon-phd/entry/19755">A Memory-sensitive HashMap Cache for Java</a>
# <a href="http://www.javaworld.com/javaworld/jw-12-2000/jw-1229-traps.html">When Process.waitFor() hangs forever</a>
# [[Runtime.exec returns -1073741515 when providing environment variables]]

[code]private abstract static strictfp class X { public static final synchronized strictfp void x(Object[] e, List x) { 
	for (int i = 0; i < e.length; i++) if (e[i] instanceof IType || (showMembers && e[i] instanceof IMember && 
	!(Flags.isPrivate(((IMember) e[i]).getFlags()) || Flags.isProtected(((IMember) e[i]).getFlags())))) x.add(e[i]); } 
}[/code]
;D

==Convert an int into a character (0-25 to a-z)==
[code]public char getchr(int c) {
	byte[] b = new byte[] { (new Integer(c + 96)).byteValue() };
	String s = new String(b);
	return s.charAt(0);
}[/code]

==Get MD5 Hash of a String==
From http://site.gravatar.com/site/implement

[code]import java.util.*;
import java.io.*;
import java.security.*;
public class MD5Util {    
  public static String hex(byte[] array) {        
      StringBuffer sb = new StringBuffer();        
      for (int i = 0; i < array.length; ++i) {            
          sb.append(Integer.toHexString((array[i] 
              & 0xFF) | 0x100).substring(1,3));        
      }        
      return sb.toString();    
  }    
  public static String md5Hex (String message) {         
      try {             
          MessageDigest md = 
              MessageDigest.getInstance("MD5");             
          return hex (md.digest(message.getBytes("CP1252")));         
      } catch (NoSuchAlgorithmException e) {         
      } catch (UnsupportedEncodingException e) {         
      }         
      return null;    
  }    
}[/code]

==Writing to a File using an InputStream==
[code]/**
 * Write an InputStream to a file. If the file exists, it will be
 * overwritten. 
 * 
 * @param file the file to write to
 * @param stream the input stream to read from
 * @throws IOException if an IO exception occurs
 */
public static void writeFile(File file, InputStream stream) throws IOException {
  FileOutputStream os = new FileOutputStream(file);

  // write from an input stream
  int bufSize = 128;
  byte[] chars = new byte[bufSize];
    int numRead = 0;
    while ((numRead = stream.read(chars)) > -1) {
      os.write(chars, 0, numRead);
    }

  os.close();
}[/code]
{{tag-todo|reference to IAML project}}

==Change the Depth of JVM Stack Trace==
This might be handy if you are running into too many (or too few) <a href="http://download.oracle.com/javase/1.4.2/docs/api/java/lang/StackOverflowError.html">StackOverflowErrors</a>. The `-Xss` parameter defines the <a href="http://www.caucho.com/resin-3.0/performance/jvm-tuning.xtp">stack size for each thread</a>, default `-Xss512k` which means 512 KB.

[[Category:Technology]]
[[Category:Languages]]
[[Category:Programming Snippets]]