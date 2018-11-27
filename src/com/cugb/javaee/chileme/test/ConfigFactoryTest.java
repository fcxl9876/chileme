package com.cugb.javaee.chileme.test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.cugb.javaee.chileme.utils.ConfigFactory;

public class ConfigFactoryTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		assertEquals("root", ConfigFactory.readProperty("username"));
	}

}
